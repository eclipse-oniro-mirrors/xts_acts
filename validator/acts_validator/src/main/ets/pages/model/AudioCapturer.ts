import audio from '@ohos.multimedia.audio'
import deviceInfo from '@ohos.deviceInfo'
import fileio from '@ohos.fileio'
import image from '@ohos.multimedia.image'
import media from '@ohos.multimedia.media'
import mediaLibrary from '@ohos.multimedia.mediaLibrary'
import Logger from '../model/Logger'
import MediaUtils from '../model/MediaUtils'
// @ts-ignore
import fs from '@ohos.file.fs'
import mediaPlay from '../model/mediaPlay'

class AudioCapturer {
    private tag: string = 'qlw AudioCapture'
    private static instance: AudioCapturer = new AudioCapturer()
    private audioCapturer: audio.AudioCapturer = undefined
    private fd: number = undefined
    private isRecorder: boolean = false
    private file: fs.File = undefined


    async createAudioCapturer() {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }
        let AudioCapturerInfo = {
            source: audio.SourceType.SOURCE_TYPE_MIC,
            capturerFlags: 0
        }
        let AudioCapturerOptions = {
            streamInfo: AudioStreamInfo,
            capturerInfo: AudioCapturerInfo
            // @ts-ignore
        }
        this.audioCapturer = await audio.createAudioCapturer(AudioCapturerOptions)
    }

    async getFileFd() {
        let filesDir = globalThis.abilityContext.filesDir
        let path = filesDir + '/test.wav'
        Logger.info(this.tag, `getFileFd path : ${path}`)
        this.file = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC)
        return this.file.fd
    }

    async startCapturer() {
        try {
            this.fd = await this.getFileFd()
            Logger.info(this.tag, `fd : ${this.fd}`)

            if (this.fd !== null) {
                Logger.info(this.tag, `create audio fileAssets success fd : ${this.fd}`)
            }
            else {
                Logger.info(this.tag, `create audio fileAssets error`)
            }

            let header = mediaPlay.encodeWAV(audio.AudioSamplingRate.SAMPLE_RATE_44100, audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE, audio.AudioChannel.CHANNEL_2)
            Logger.info(this.tag, `wav header length: ${header.buffer.byteLength}`)
            fs.writeSync(this.fd, header.buffer)

            this.audioCapturer.start(async (err) => {
                if (err) {
                    Logger.info(this.tag, `Capture start failed`)
                } else {
                    Logger.info(this.tag, `Capture start success`)
                    let bufferSize = await this.audioCapturer.getBufferSize()
                    Logger.info(this.tag, `audioCapture bufferSize: ${bufferSize}`)
                    this.isRecorder = true
                    while (this.isRecorder) {
                        Logger.info(this.tag, 'audioCapture: ---------READ BUFFER---------')
                        let buffer = await this.audioCapturer.read(bufferSize, true)
                        Logger.info(this.tag, 'audioCapture: ---------WRITE BUFFER---------')
                        fs.writeSync(this.fd, buffer)
                    }
                }
            })
        } catch (err) {
            Logger.info(this.tag, `startCapturer fail err: ${err}, message: ${err.message}, code: ${err.code}`)
        }

    }

    async stopCapturer() {
        try {
            await this.audioCapturer.stop()
            this.isRecorder = false
            Logger.info(this.tag, `stopCapturer success`)
        } catch (err) {
            Logger.info(this.tag, `stopCapturer fail err: ${err}, message: ${err.message}, code: ${err.code}`)
        }
    }

    async releaseCapturer() {
        try {
            if (this.audioCapturer) {
                await this.audioCapturer.release()
                Logger.info(this.tag, `releaseCapturer success`)
            }
            if (this.file) {
                fs.closeSync(this.file);
                Logger.info(this.tag, `release file success`)
            }
        } catch (err) {
            Logger.info(this.tag, `stopCapturer fail err: ${err}, message: ${err.message}, code: ${err.code}`)
        }
    }
}

export default new AudioCapturer()