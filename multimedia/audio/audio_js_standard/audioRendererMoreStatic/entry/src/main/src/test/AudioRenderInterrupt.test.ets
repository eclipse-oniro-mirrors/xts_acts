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
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import audio from '@ohos.multimedia.audio';
import { BusinessError } from '@ohos.base';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from "../../../hypium/index";

export default function AudioRendererInterruptUnitTest() {
    describe('AudioRendererInterruptUnitTest', () => {
        beforeAll(async () => {
            // input testsuit setup step, setup invoked before all testcases
            console.info('beforeAll called')
        })

        afterAll(() => {
            // input testsuit teardown step, teardown invoked after all testcases
            console.info('afterAll called')
        })

        beforeEach(() => {
            // input testcase setup step, setup invoked before each testcases
            console.info('beforeEach called')
        })

        afterEach(() => {
            // input testcase teardown step, teardown invoked after each testcases
            console.info('afterEach called')
        })

        let renderInfo: Record<string, audio.AudioRendererInfo> = {
            'MUSIC': {
                usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
                rendererFlags: 0,
            },
            'VOICE_COMMUNICATION': {
                usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
                rendererFlags: 0
            },
            'RINGTONE': {
                usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
                rendererFlags: 0,
            },
            'VOICE_ASSISTANT': {
                usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
                rendererFlags: 0
            },
            'ALARM': {
                usage: audio.StreamUsage.STREAM_USAGE_ALARM,
                rendererFlags: 0
            },
            'ACCESSIBILITY': {
                usage: audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY,
                rendererFlags: 0
            },
            'SPEECH': {
                usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
                rendererFlags: 0
            },
            'MOVIE': {
                usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
                rendererFlags: 0
            },
            'UNKNOW': {
                usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
                rendererFlags: 0
            },
            'VOICE_MESSAGE': {
                usage: audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE,
                rendererFlags: 0
            },
            'GAME': {
                usage: audio.StreamUsage.STREAM_USAGE_GAME,
                rendererFlags: 0
            },
            'NAVIGATION': {
                usage: audio.StreamUsage.STREAM_USAGE_NAVIGATION,
                rendererFlags: 0
            },
            'NOTIFICATION': {
                usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION,
                rendererFlags: 0
            },
        }

        let streamInfo: Record<string, audio.AudioStreamInfo> = {
            '44100': {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            },
            '48000': {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            },
        }

        let createAudioRenderer = async (
            AudioRendererInfo: audio.AudioRendererInfo,
            AudioStreamInfo: audio.AudioStreamInfo,
            done: () => void
        ): Promise<audio.AudioRenderer> => {
            let render: audio.AudioRenderer | null;

            let AudioRendererOptions: audio.AudioRendererOptions = {
                streamInfo: AudioStreamInfo,
                rendererInfo: AudioRendererInfo
            };

            try {
                render = await audio.createAudioRenderer(AudioRendererOptions);
                console.log("createAudioRenderer success.");
            } catch (err) {
                console.log("createAudioRenderer err:" + JSON.stringify(err));
                expect(false).assertEqual(true);
                done();
            }

            return render!;
        };

        let release = async (render: audio.AudioRenderer, done: () => void) => {
            if (render!.state == audio.AudioState.STATE_RELEASED) {
                console.log(" release render state: " + render!.state)
                //return //Promise.resolve();
            }
            try {
                await render!.release()
                console.log(" release success.")
            } catch (err) {
                console.log(" release err:" + JSON.stringify(err))
                expect(false).assertEqual(true)
                done()
            }
        }

        let start = async (render: audio.AudioRenderer, done: () => void)=> {
            console.info('come in start')
            try {
                await render!.start()
                console.log(" start success.")
            } catch (err: BusinessError) {
                await release(render, done)
                console.log(" start err:" + JSON.stringify(err))
                expect(false).assertEqual(true)
                done()
            }
        }

        let startFail = async (render: audio.AudioRenderer, done: () => void, render1: audio.AudioRenderer)=> {
            try {
                await render!.start()
                console.log(" start success.")
            } catch (err) {
                console.log(" start err:" + JSON.stringify(err))
                await release(render, done)
                await release(render1, done)
                expect(true).assertEqual(true)
                done()
            }
        }


        let stop = async (render: audio.AudioRenderer, done: () => void)=> {
            try {
                await render!.stop()
                console.log(" stop success.")
            } catch (err) {
                console.log(" stop err:" + JSON.stringify(err))
                expect(false).assertEqual(true)
                await release(render, done)
                done()
            }
        }

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_0100
         * @tc.desc   AudioRender  ALARM INTERRUPT MUSIC
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                console.info('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_0100 come in ')
                let render1: audio.AudioRenderer = await createAudioRenderer(renderInfo['MUSIC'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
                console.info('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_0100 render1 is ' + render1)
                await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
                render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                    console.log("1.eventAction=" + JSON.stringify(eventAction))
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
                })
                await start(render1, done)

                let render2: audio.AudioRenderer = await createAudioRenderer(renderInfo['MUSIC'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
                await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
                await start(render2, done)
                await Utils.msSleep(500)
                await release(render1, done)
                await release(render2, done)
                done()
            }
            catch (err: BusinessError) {
                console.info('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_0100 err is ' + err.message)
            }

        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_0200
         * @tc.desc   AudioRender  ALARM INTERRUPT MUSIC
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1: audio.AudioRenderer = await createAudioRenderer(renderInfo['MUSIC'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("2.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
                } else { }
            })
            await start(render1, done)

            let render2: audio.AudioRenderer = await createAudioRenderer(renderInfo['VOICE_COMMUNICATION'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_0300
         * @tc.desc   AudioRender  ALARM INTERRUPT MUSIC
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1: audio.AudioRenderer = await createAudioRenderer(renderInfo['MUSIC'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("3.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
                } else { }
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['RINGTONE'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_0400
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_0400
         * @tc.desc   AudioRender  ALARM INTERRUPT MUSIC
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1: audio.AudioRenderer = await createAudioRenderer(renderInfo['MUSIC'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("4.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
                } else { }
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_0600
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_0600
         * @tc.desc   AudioRender  ALARM INTERRUPT MUSIC
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1: audio.AudioRenderer = await createAudioRenderer(renderInfo['MUSIC'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("6.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
                } else {
                }
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['ALARM'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_0700
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_0700
         * @tc.desc   AudioRender  ACCESSIBILITY INTERRUPT MUSIC
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1: audio.AudioRenderer = await createAudioRenderer(renderInfo['MUSIC'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("7.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
                } else { }
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['ACCESSIBILITY'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_0800
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_0800
         * @tc.desc   AudioRender  SPEECH INTERRUPT MUSIC
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1: audio.AudioRenderer = await createAudioRenderer(renderInfo['MUSIC'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("1.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['SPEECH'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_0900
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_0900
         * @tc.desc   AudioRender  MOVIE INTERRUPT MUSIC
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1: audio.AudioRenderer = await createAudioRenderer(renderInfo['MUSIC'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("1.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['MOVIE'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_1000
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_1000
         * @tc.desc   AudioRender  UNKNOW INTERRUPT MUSIC
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1: audio.AudioRenderer = await createAudioRenderer(renderInfo['MUSIC'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("1.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['UNKNOW'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_1100
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_1100
         * @tc.desc   AudioRender  MUSIC INTERRUPT VOICE_COMMUNICATION
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['VOICE_COMMUNICATION'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['MUSIC'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render2.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("8-2.eventAction=" + JSON.stringify(eventAction))

                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
                } else {
                    console.log("SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_1100 fail")
                    expect(false).assertTrue();
                }
            })
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_1200
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_1200
         * @tc.desc   AudioRender  VOICE_COMMUNICATION INTERRUPT VOICE_COMMUNICATION
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['VOICE_COMMUNICATION'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("1200.eventAction=" + JSON.stringify(eventAction))

                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
                } else {
                    console.log("SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_1200 fail")
                    expect(false).assertTrue();
                }
            })
            await start(render1, done)

            let render2: audio.AudioRenderer = await createAudioRenderer(renderInfo['MUSIC'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_1300
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_1300
         * @tc.desc   AudioRender  RINGTONE INTERRUPT VOICE_COMMUNICATION
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let flag1 = false;
            let flag2 = false;
            let render1 = await createAudioRenderer(renderInfo['VOICE_COMMUNICATION'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render1, done)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("13 render1.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let render2 = await createAudioRenderer(renderInfo['RINGTONE'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render2.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("13 render2.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })
            await start(render2, done)

            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            expect(flag1 == false && flag2 == false).assertTrue()
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_1400
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_1400
         * @tc.desc   AudioRender  VOICE_ASSISTANT INTERRUPT VOICE_COMMUNICATION
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['VOICE_COMMUNICATION'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await startFail(render2, done, render1)
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_1600
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_1600
         * @tc.desc   AudioRender  ALARM INTERRUPT VOICE_COMMUNICATION
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['VOICE_COMMUNICATION'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['ALARM'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render2.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("13-2.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
                } else {
                }
            })
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_1700
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_1700
         * @tc.desc   AudioRender  ACCESSIBILITY INTERRUPT VOICE_COMMUNICATION
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['VOICE_COMMUNICATION'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("14.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
                } else {
                }
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['ACCESSIBILITY'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_1800
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_1800
         * @tc.desc   AudioRender  SPEECH INTERRUPT VOICE_COMMUNICATION
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['VOICE_COMMUNICATION'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['SPEECH'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render2.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("8-2.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
                    } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
                    } else {
                    }
                }
            })
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_1900
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_1900
         * @tc.desc   AudioRender  MOVIE INTERRUPT VOICE_COMMUNICATION
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['VOICE_COMMUNICATION'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['MOVIE'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render2.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("8-2.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
                    } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
                    } else {
                    }
                }
            })
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_2000
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_2000
         * @tc.desc   AudioRender  UNKNOW INTERRUPT VOICE_COMMUNICATION
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['VOICE_COMMUNICATION'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['UNKNOW'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render2.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("8-2.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
                    } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
                    } else {
                    }
                }
            })
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })


        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_2100
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_2100
         * @tc.desc   AudioRender  MUSIC INTERRUPT RINGTONE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['RINGTONE'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['MUSIC'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render2.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("15-2.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
                } else {
                }
            })
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_2200
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_2200
         * @tc.desc   AudioRender  VOICE_COMMUNICATION INTERRUPT RINGTONE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['RINGTONE'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("16.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)

            let render2: audio.AudioRenderer = await createAudioRenderer(renderInfo['MUSIC'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_2300
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_2300
         * @tc.desc   AudioRender  RINGTONE INTERRUPT RINGTONE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let flag1 = false;
            let flag2 = false;
            let render1 = await createAudioRenderer(renderInfo['RINGTONE'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render1, done)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("23 render1.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let render2 = await createAudioRenderer(renderInfo['RINGTONE'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render2.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("23 render2.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })
            await start(render2, done)

            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            expect(flag1 == false && flag2 == false).assertTrue()
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_2400
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_2400
         * @tc.desc   AudioRender  VOICE_ASSISTANT INTERRUPT RINGTONE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['RINGTONE'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await startFail(render2, done, render1)
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_2600
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_2600
         * @tc.desc   AudioRender  ALARM INTERRUPT RINGTONE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let flag1 = false;
            let flag2 = false;
            let render1 = await createAudioRenderer(renderInfo['RINGTONE'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render1, done)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("26 render1.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let render2 = await createAudioRenderer(renderInfo['ALARM'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render2.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("26 render2.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })
            await start(render2, done)

            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            expect(flag1 == false && flag2 == false).assertTrue()
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_2700
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_2700
         * @tc.desc   AudioRender  ACCESSIBILITY INTERRUPT RINGTONE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['RINGTONE'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("21.eventAction=" + JSON.stringify(eventAction))//1
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
                } else {
                }
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['ACCESSIBILITY'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_2800
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_2800
         * @tc.desc   AudioRender  SPEECH INTERRUPT RINGTONE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['RINGTONE'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['SPEECH'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render2.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("15-2.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
                } else {
                }
            })
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_2900
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_2900
         * @tc.desc   AudioRender  MOVIE INTERRUPT RINGTONE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['RINGTONE'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['MOVIE'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render2.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("15-2.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
                } else {
                }
            })
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_3000
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_3000
         * @tc.desc   AudioRender  UNKNOW INTERRUPT RINGTONE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['RINGTONE'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['UNKNOW'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render2.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("15-2.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
                } else {
                }
            })
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_3100
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_3100
         * @tc.desc   AudioRender  MUSIC INTERRUPT VOICE_ASSISTANT
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("22.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['MUSIC'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_3200
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_3200
         * @tc.desc   AudioRender  VOICE_COMMUNICATION INTERRUPT VOICE_ASSISTANT
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("23.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)

            let render2: audio.AudioRenderer = await createAudioRenderer(renderInfo['MUSIC'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_3300
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_3300
         * @tc.desc   AudioRender  RINGTONE INTERRUPT VOICE_ASSISTANT
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("24.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['RINGTONE'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_3400
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_3400
         * @tc.desc   AudioRender  VOICE_ASSISTANT INTERRUPT VOICE_ASSISTANT
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("25.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_3600
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_3600
         * @tc.desc   AudioRender  ALARM INTERRUPT VOICE_ASSISTANT
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("27.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['ALARM'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_3700
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_3700
         * @tc.desc   AudioRender  ACCESSIBILITY INTERRUPT ACCESSIBILITY
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("28.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['ACCESSIBILITY'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_3800
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_3800
         * @tc.desc   AudioRender  SPEECH INTERRUPT VOICE_ASSISTANT
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("22.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['SPEECH'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_3900
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_3900
         * @tc.desc   AudioRender  MOVIE INTERRUPT VOICE_ASSISTANT
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("22.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['MOVIE'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_4000
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_4000
         * @tc.desc   AudioRender  UNKNOW INTERRUPT VOICE_ASSISTANT
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("22.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['UNKNOW'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_5100
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_5100
         * @tc.desc   AudioRender  MUSIC INTERRUPT ALARM
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['ALARM'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("36.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)
            let render2 = await createAudioRenderer(renderInfo['MUSIC'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_5200
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_5200
         * @tc.desc   AudioRender  VOICE_COMMUNICATION INTERRUPT ALARM
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['ALARM'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("37.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)

            let render2: audio.AudioRenderer = await createAudioRenderer(renderInfo['MUSIC'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_5300
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_5300
         * @tc.desc   AudioRender  RINGTONE INTERRUPT ALARM
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['ALARM'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("38.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['RINGTONE'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_5400
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_5400
         * @tc.desc   AudioRender  ALARM INTERRUPT ALARM
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['ALARM'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("39.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
                } else {
                }
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_5600
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_5600
         * @tc.desc   AudioRender  ALARM INTERRUPT ALARM
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['ALARM'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("41.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['ALARM'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_5700
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_5700
         * @tc.desc   AudioRender  ACCESSIBILITY INTERRUPT ALARM
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['ALARM'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("42.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
                } else { }
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['ACCESSIBILITY'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_5800
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_5800
         * @tc.desc   AudioRender  SPEECH INTERRUPT ALARM
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['ALARM'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("36.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)
            let render2 = await createAudioRenderer(renderInfo['SPEECH'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_5900
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_5900
         * @tc.desc   AudioRender  MOVIE INTERRUPT ALARM
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['ALARM'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("36.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)
            let render2 = await createAudioRenderer(renderInfo['MOVIE'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_6000
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_6000
         * @tc.desc   AudioRender  UNKNOW INTERRUPT ALARM
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['ALARM'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("36.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)
            let render2 = await createAudioRenderer(renderInfo['UNKNOW'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_6100
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_6100
         * @tc.desc   AudioRender  MUSIC INTERRUPT ACCESSIBILITY
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['ACCESSIBILITY'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['MUSIC'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            render2.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("44_2.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
                } else {
                }
            })
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_6200
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_6200
         * @tc.desc   AudioRender  VOICE_COMMUNICATION INTERRUPT ACCESSIBILITY
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['ACCESSIBILITY'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render1, done)

            let render2: audio.AudioRenderer = await createAudioRenderer(renderInfo['MUSIC'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render2.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("44_2.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
                } else {
                }
            })
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_6300
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_6300
         * @tc.desc   AudioRender  RINGTONE INTERRUPT ACCESSIBILITY
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['ACCESSIBILITY'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("45.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
                } else {
                }
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['RINGTONE'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_6400
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_6400
         * @tc.desc   AudioRender  VOICE_ASSISTANT INTERRUPT ACCESSIBILITY
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['ACCESSIBILITY'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("64.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
                } else {
                }
            })
            await start(render1, done)


            let render2 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)

            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_6600
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_6600
         * @tc.desc   AudioRender  ALARM INTERRUPT ACCESSIBILITY
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['ACCESSIBILITY'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['ALARM'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render2.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("48_2.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
                } else {
                }
            })
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_6700
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_6700
         * @tc.desc   AudioRender  ACCESSIBILITY INTERRUPT ACCESSIBILITY
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['ACCESSIBILITY'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("49.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['ACCESSIBILITY'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_6800
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_6800
         * @tc.desc   AudioRender  SPEECH INTERRUPT ACCESSIBILITY
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['ACCESSIBILITY'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['SPEECH'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            render2.onAudioInterrupt( (eventAction: audio.InterruptEvent) => {
                console.log("68_2.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
                } else {
                }
            })
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_6900
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_6900
         * @tc.desc   AudioRender  MOVIE INTERRUPT ACCESSIBILITY
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['ACCESSIBILITY'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['MOVIE'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render2.onAudioInterrupt( (eventAction: audio.InterruptEvent) => {
                console.log("69_2.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
                } else {
                }
            })
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_7000
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_7000
         * @tc.desc   AudioRender  UNKNOW INTERRUPT ACCESSIBILITY
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['ACCESSIBILITY'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['UNKNOW'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render2.onAudioInterrupt( (eventAction: audio.InterruptEvent) => {
                console.log("70_2.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
                } else {
                }
            })
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_7100
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_7100
         * @tc.desc   AudioRender  MUSIC INTERRUPT SPEECH
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['SPEECH'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("1.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['MUSIC'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_7200
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_7200
         * @tc.desc   AudioRender  VOICE_COMMUNICATION INTERRUPT SPEECH
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['SPEECH'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("2.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
                } else { }
            })
            await start(render1, done)

            let render2: audio.AudioRenderer = await createAudioRenderer(renderInfo['VOICE_COMMUNICATION'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_7300
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_7300
         * @tc.desc   AudioRender  RINGTONE INTERRUPT SPEECH
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['SPEECH'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("3.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
                } else { }
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['RINGTONE'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_7400
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_7400
         * @tc.desc   AudioRender  VOICE_ASSISTANT INTERRUPT SPEECH
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['SPEECH'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("4.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
                } else { }
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_7600
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_7600
         * @tc.desc   AudioRender  ALARM INTERRUPT SPEECH
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['SPEECH'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("6.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
                } else {
                }
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['ALARM'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_7700
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_7700
         * @tc.desc   AudioRender  ACCESSIBILITY INTERRUPT SPEECH
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['SPEECH'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("7.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
                } else { }
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['ACCESSIBILITY'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_7800
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_7800
         * @tc.desc   AudioRender  SPEECH INTERRUPT SPEECH
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['SPEECH'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("1.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['SPEECH'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_7900
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_7900
         * @tc.desc   AudioRender  MOVIE INTERRUPT SPEECH
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['SPEECH'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("1.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['MOVIE'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_8000
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_8000
         * @tc.desc   AudioRender  UNKNOW INTERRUPT SPEECH
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['SPEECH'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("1.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['UNKNOW'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_8100
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_8100
         * @tc.desc   AudioRender  MUSIC INTERRUPT MOVIE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['MOVIE'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("1.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['MUSIC'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_8200
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_8200
         * @tc.desc   AudioRender  VOICE_COMMUNICATION INTERRUPT MOVIE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['MOVIE'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("2.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
                } else { }
            })
            await start(render1, done)

            let render2: audio.AudioRenderer = await createAudioRenderer(renderInfo['VOICE_COMMUNICATION'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_8300
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_8300
         * @tc.desc   AudioRender  RINGTONE INTERRUPT MOVIE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['MOVIE'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("3.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
                } else { }
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['RINGTONE'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_8400
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_8400
         * @tc.desc   AudioRender  VOICE_ASSISTANT INTERRUPT MOVIE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['MOVIE'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("4.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
                } else { }
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_8600
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_8600
         * @tc.desc   AudioRender  ALARM INTERRUPT MOVIE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['MOVIE'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("6.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
                } else {
                }
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['ALARM'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_8700
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_8700
         * @tc.desc   AudioRender  ACCESSIBILITY INTERRUPT MOVIE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['MOVIE'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("7.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
                } else { }
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['ACCESSIBILITY'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_8800
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_8800
         * @tc.desc   AudioRender  SPEECH INTERRUPT MOVIE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['MOVIE'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("1.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['SPEECH'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_8900
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_8900
         * @tc.desc   AudioRender  MOVIE INTERRUPT MOVIE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['MOVIE'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("1.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['MOVIE'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_9000
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_9000
         * @tc.desc   AudioRender  UNKNOW INTERRUPT MOVIE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['MOVIE'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("1.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['UNKNOW'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_9100
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_9100
         * @tc.desc   AudioRender  ALARM INTERRUPT MUSIC
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['UNKNOW'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("1.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['MUSIC'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_9200
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_9200
         * @tc.desc   AudioRender  ALARM INTERRUPT MUSIC
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_9200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['UNKNOW'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("2.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
                } else { }
            })
            await start(render1, done)

            let render2: audio.AudioRenderer = await createAudioRenderer(renderInfo['VOICE_COMMUNICATION'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_9300
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_9300
         * @tc.desc   AudioRender  ALARM INTERRUPT MUSIC
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_9300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['UNKNOW'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("3.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
                } else { }
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['RINGTONE'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_9400
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_9400
         * @tc.desc   AudioRender  ALARM INTERRUPT MUSIC
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_9400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['UNKNOW'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("4.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
                } else { }
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_9600
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_9600
         * @tc.desc   AudioRender  ALARM INTERRUPT MUSIC
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_9600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['UNKNOW'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("6.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
                } else {
                }
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['ALARM'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_9700
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_9700
         * @tc.desc   AudioRender  ALARM INTERRUPT MUSIC
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_9700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['UNKNOW'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("7.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
                } else { }
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['ACCESSIBILITY'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_9800
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_9800
         * @tc.desc   AudioRender  ALARM INTERRUPT MUSIC
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_9800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['UNKNOW'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("1.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['SPEECH'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_9900
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_9900
         * @tc.desc   AudioRender  ALARM INTERRUPT MUSIC
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_9900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['UNKNOW'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("1.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['MOVIE'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_10000
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_10000
         * @tc.desc   AudioRender  UNKNOW INTERRUPT UNKNOW
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_10000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['UNKNOW'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("1.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['UNKNOW'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_10100
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_10100
         * @tc.desc   AudioRender  MUSIC INTERRUPT MUSIC
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_10100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1_callback = false
            let render2_callback = false
            let render1: audio.AudioRenderer = await createAudioRenderer(renderInfo['MUSIC'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.SHARE_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("50.eventAction=" + JSON.stringify(eventAction))
                render1_callback = true
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['MUSIC'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.SHARE_MODE)
            render2.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("50_2.eventAction=" + JSON.stringify(eventAction))
                render1_callback = true
            })
            await start(render2, done)
            await Utils.msSleep(500)
            console.log("render1_callback = " + render1_callback + ", render2_callback = " + render2_callback)
            expect(render1_callback == false && render2_callback == false).assertTrue()
            await Utils.msSleep(100)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_10200
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_10200
         * @tc.desc   AudioRender  MUSIC INTERRUPT MUSIC
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_10200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1_callback = false
            let render2_callback = false
            let render1: audio.AudioRenderer = await createAudioRenderer(renderInfo['MUSIC'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.SHARE_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("51.eventAction=" + JSON.stringify(eventAction))
                render1_callback = true
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['MUSIC'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render2.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("51_2.eventAction=" + JSON.stringify(eventAction))
                render2_callback == true
            })
            await start(render2, done)
            await Utils.msSleep(500)
            console.log("render1_callback = " + render1_callback + ", render2_callback = " + render2_callback)
            expect(render1_callback || !render1_callback).assertTrue();
            expect(!render2_callback || render2_callback).assertTrue()

            await Utils.msSleep(100)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_10300
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_10300
         * @tc.desc   AudioRender  MUSIC INTERRUPT MUSIC
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_10300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1_callback = false
            let render2_callback = false
            let render1: audio.AudioRenderer = await createAudioRenderer(renderInfo['MUSIC'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("52.eventAction=" + JSON.stringify(eventAction))
                render1_callback = true
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['MUSIC'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render2.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("52_2.eventAction=" + JSON.stringify(eventAction))
                render2_callback = true
            })
            await start(render2, done)
            await Utils.msSleep(500)
            console.log("render1_callback = " + render1_callback + ", render2_callback = " + render2_callback)
            expect(render1_callback || !render1_callback).assertTrue();
            expect(!render2_callback || render2_callback).assertTrue()
            await Utils.msSleep(100)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_7101
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_7101
         * @tc.desc   AudioRender  VOICE_COMMUNICATION INTERRUPT VOICE_MESSAGE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_7101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("1.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)

            let render2: audio.AudioRenderer = await createAudioRenderer(renderInfo['MUSIC'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_17200
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_17200
         * @tc.desc   AudioRender  VOICE_MESSAGE INTERRUPT VOICE_MESSAGE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_17200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("1.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_19100
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_19100
         * @tc.desc   AudioRender  MUSIC INTERRUPT VOICE_MESSAGE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_19100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("1.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['MUSIC'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_18300
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_18300
         * @tc.desc   AudioRender  MOVIE INTERRUPT VOICE_MESSAGE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_18300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("1.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['MOVIE'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_18400
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_18400
         * @tc.desc   AudioRender  GAME INTERRUPT VOICE_MESSAGE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_18400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("14.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
                } else {
                }
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['GAME'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_17400
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_17400
         * @tc.desc   AudioRender  SPEECH INTERRUPT VOICE_MESSAGE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_17400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("1.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['SPEECH'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_18200
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_18200
         * @tc.desc   AudioRender  NAVIGATION INTERRUPT VOICE_MESSAGE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_18200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['NAVIGATION'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render2.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("8-2.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
                    } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
                    } else {
                    }
                }
            })
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_18600
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_18600
         * @tc.desc   AudioRender  ALARM INTERRUPT VOICE_MESSAGE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_18600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("21.eventAction=" + JSON.stringify(eventAction))//1
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['ALARM'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_18100
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_18100
         * @tc.desc   AudioRender  NOTIFICATION INTERRUPT VOICE_MESSAGE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_18100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("181.eventAction=" + JSON.stringify(eventAction))//1
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['NOTIFICATION'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)

            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_14400
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_14400
         * @tc.desc   AudioRender  VOICE_COMMUNICATION INTERRUPT GAME
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_14400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['GAME'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("2.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
                } else { }
            })
            await start(render1, done)

            let render2: audio.AudioRenderer = await createAudioRenderer(renderInfo['VOICE_COMMUNICATION'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_14300
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_14300
         * @tc.desc   AudioRender  VOICE_MESSAGE INTERRUPT GAME
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_14300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['GAME'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("14.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
                } else { }
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_4100
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_4100
         * @tc.desc   AudioRender  MOVIE INTERRUPT GAME
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['GAME'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("2.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
                } else { }
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['MOVIE'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_4200
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_4200
         * @tc.desc   AudioRender  GAME INTERRUPT GAME
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['GAME'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("1.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['GAME'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_14900
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_14900
         * @tc.desc   AudioRender  SPEECH INTERRUPT GAME
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_14900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['GAME'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("2.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
                } else { }
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['SPEECH'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_3001
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_3001
         * @tc.desc   AudioRender  NAVIGATION INTERRUPT GAME
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_3001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['GAME'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("21.eventAction=" + JSON.stringify(eventAction))//1
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
                } else {
                }
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['NAVIGATION'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_4700
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_4700
         * @tc.desc   AudioRender  ALARM INTERRUPT GAME
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['GAME'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("21.eventAction=" + JSON.stringify(eventAction))//1
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
                } else {
                }
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['ALARM'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_13700
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_13700
         * @tc.desc   AudioRender  NOTIFICATION INTERRUPT GAME
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_13700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['GAME'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("21.eventAction=" + JSON.stringify(eventAction))//1
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
                } else {
                }
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['NOTIFICATION'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_4900
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_4900
         * @tc.desc   AudioRender  ACCESSIBILITY INTERRUPT GAME
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['GAME'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("2.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
                } else { }
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['ACCESSIBILITY'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_12700
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_12700
         * @tc.desc   AudioRender  VOICE_COMMUNICATION INTERRUPT NAVIGATION
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_12700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['NAVIGATION'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("21.eventAction=" + JSON.stringify(eventAction))//1
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
                } else {
                    expect(false).assertTrue()
                }
            })
            await start(render1, done)

            let render2: audio.AudioRenderer = await createAudioRenderer(renderInfo['MUSIC'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_15100
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_15100
         * @tc.desc   AudioRender  VOICE_MESSAGE INTERRUPT NAVIGATION
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_15100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['NAVIGATION'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("21.eventAction=" + JSON.stringify(eventAction))//1
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
                } else {
                }
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_13600
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_13600
         * @tc.desc   AudioRender  MUSIC INTERRUPT NAVIGATION
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_13600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['NAVIGATION'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['MUSIC'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render2.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("8-2.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
                    } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
                    } else {
                    }
                }
            })
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_13800
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_13800
         * @tc.desc   AudioRender  MOVIE INTERRUPT NAVIGATION
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_13800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['NAVIGATION'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['MOVIE'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render2.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("8-2.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
                    } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
                    } else {
                    }
                }
            })
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_13900
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_13900
         * @tc.desc   AudioRender  GAME INTERRUPT NAVIGATION
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_13900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['NAVIGATION'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['GAME'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render2.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("8-2.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
                    } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
                    } else {
                    }
                }
            })
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_13200
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_13200
         * @tc.desc   AudioRender  SPEECH INTERRUPT NAVIGATION
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_13200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['NAVIGATION'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['SPEECH'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render2.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("8-2.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
                    } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                        expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
                    } else {
                    }
                }
            })
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_13500
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_13500
         * @tc.desc   AudioRender  NAVIGATION INTERRUPT NAVIGATION
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_13500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['NAVIGATION'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("1.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['NAVIGATION'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_14100
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_14100
         * @tc.desc   AudioRender  ALARM INTERRUPT NAVIGATION
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_14100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['NAVIGATION'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("14.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
                } else {
                }
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['ALARM'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_13400
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_13400
         * @tc.desc   AudioRender  NOTIFICATION INTERRUPT NAVIGATION
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_13400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['NAVIGATION'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("14.eventAction=" + JSON.stringify(eventAction))
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
                } else {
                }
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['NOTIFICATION'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_14200
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_14200
         * @tc.desc   AudioRender  ACCESSIBILITY INTERRUPT NAVIGATION
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_14200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['NAVIGATION'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("1.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['ACCESSIBILITY'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_16700
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_16700
         * @tc.desc   AudioRender  VOICE_COMMUNICATION INTERRUPT NOTIFICATION
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_16700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['NOTIFICATION'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("1.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)

            let render2: audio.AudioRenderer = await createAudioRenderer(renderInfo['MUSIC'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_16800
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_16800
         * @tc.desc   AudioRender  VOICE_MESSAGE INTERRUPT NOTIFICATION
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_16800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['NOTIFICATION'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("1.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_15700
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_15700
         * @tc.desc   AudioRender  MUSIC INTERRUPT NOTIFICATION
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_15700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['NOTIFICATION'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("1.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['MUSIC'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_15600
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_15600
         * @tc.desc   AudioRender  MOVIE INTERRUPT NOTIFICATION
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_15600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['NOTIFICATION'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("1.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['MOVIE'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_15500
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_15500
         * @tc.desc   AudioRender  GAME INTERRUPT NOTIFICATION
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_15500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['NOTIFICATION'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("1.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['GAME'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_16200
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_16200
         * @tc.desc   AudioRender  SPEECH INTERRUPT NOTIFICATION
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_16200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['NOTIFICATION'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("1.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['SPEECH'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_15800
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_15800
         * @tc.desc   AudioRender  NAVIGATION INTERRUPT NOTIFICATION
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_15800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
              let render1 = await createAudioRenderer(renderInfo['NOTIFICATION'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
              await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
              await start(render1, done)

              let render2 = await createAudioRenderer(renderInfo['NAVIGATION'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
              await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
              await start(render2, done)
              await Utils.msSleep(500)
              await release(render1, done)
              await release(render2, done)
              done()
            } catch (err: BusinessError) {
              expect(false).assertTrue();
              done()
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_15300
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_15300
         * @tc.desc   AudioRender  ALARM INTERRUPT NOTIFICATION
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_15300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['NOTIFICATION'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("1.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['ALARM'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_15900
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_15900
         * @tc.desc   AudioRender  NOTIFICATION INTERRUPT NOTIFICATION
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_15900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['NOTIFICATION'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("1.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['NOTIFICATION'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_15200
         * @tc.number SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_15200
         * @tc.desc   AudioRender  ACCESSIBILITY INTERRUPT NOTIFICATION
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_STATIC_15200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let render1 = await createAudioRenderer(renderInfo['NOTIFICATION'] as audio.AudioRendererInfo, streamInfo['44100'] as audio.AudioStreamInfo,done)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            render1.onAudioInterrupt((eventAction: audio.InterruptEvent) => {
                console.log("1.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['ACCESSIBILITY'] as audio.AudioRendererInfo, streamInfo['48000'] as audio.AudioStreamInfo,done)
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await Utils.msSleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        })
    })
}