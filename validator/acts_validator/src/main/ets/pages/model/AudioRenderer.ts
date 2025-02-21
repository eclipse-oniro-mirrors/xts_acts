/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import audio from '@ohos.multimedia.audio'
import Logger from '../model/Logger'
// @ts-ignore
import fs from '@ohos.file.fs';


class AudioRenderer {
    private tag: string = 'qlw AudioRenderer'
    private static instance: AudioRenderer = new AudioRenderer()
    private audioRenderer: audio.AudioRenderer = undefined
    private fd: number = undefined
    private offset: number = undefined
    private length: number = undefined

    async createAudioRenderer() {
        let audioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_2,
            //            channels: audio.AudioChannel.CHANNEL_1,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }
        let audioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_MUSIC,
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
        }
        let audioRendererOptions = {
            streamInfo: audioStreamInfo,
            rendererInfo: audioRendererInfo
        }
        this.audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
    }

    async startRenderer() {
        try {
            await this.audioRenderer.start()
            globalThis.abilityContext.resourceManager.getRawFd("test_44100_2.wav").then(async (value) => {
                this.fd = value.fd
                this.offset = value.offset
                this.length = value.length
                Logger.info(this.tag, `getRawFd fd : ${this.fd}, offset: ${value.offset}, length: ${value.length}`)
                let bufferSize = await this.audioRenderer.getBufferSize()
                Logger.info(this.tag, `audioRenderer bufferSize:` + JSON.stringify(bufferSize))
                let len = this.length % bufferSize == 0 ? Math.floor(this.length / bufferSize) : Math.floor(this.length / bufferSize + 1);
                let buf = new ArrayBuffer(bufferSize);
                while (true) {
                    for (let i = 0; i < len; i++) {
                        let options = {
                            offset: i * bufferSize + this.offset,
                            length: bufferSize
                        }
                        await fs.read(this.fd, buf, options)
                        try {
                            await this.audioRenderer.write(buf)
                        } catch (err) {
                            console.error(`audioRenderer.write err: ${err}`)
                        }
                    }
                }
            }).catch(err => {
                console.log(`getRawFd fail err: ${err}, message: ${err.message}, code: ${err.code}`);
            })
        } catch (err) {
            Logger.info(this.tag, `startRenderer fail err: ${err}, message: ${err.message}, code: ${err.code}`)
        }
    }

    async stopRenderer() {
        try {
            await this.audioRenderer.stop()
        } catch (err) {
            Logger.info(this.tag, `stopCapturer fail err: ${err}, message: ${err.message}, code: ${err.code}`)
        }
    }

    async releaseRenderer() {
        try {
            if (this.audioRenderer) {
                await this.audioRenderer.release()
                await globalThis.abilityContext.resourceManager.closeRawFd('test_44100_2.wav').then(() => {
                    Logger.info(this.tag, `closeRawFileDescriptor success`)
                }).catch(err => {
                    Logger.info(this.tag, `closeRawFileDescriptor fail err: ${err}, message: ${err.message}, code: ${err.code}`)
                });
            }
        } catch (err) {
            Logger.info(this.tag, `stopCapturer fail err: ${err}, message: ${err.message}, code: ${err.code}`)
        }
    }

}

export default new AudioRenderer()