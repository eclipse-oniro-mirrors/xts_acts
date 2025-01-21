import audio from '@ohos.multimedia.audio'
import fileio from '@ohos.fileio'
import Logger from '../model/Logger'
// @ts-ignore
import fs from '@ohos.file.fs';


class AudioRenderer {
    private tag: string = 'qlw AudioRenderer'
    private static instance: AudioRenderer = new AudioRenderer()
    private audioRenderer: audio.AudioRenderer = undefined
    private fd: number = undefined
    private offset: number = undefined

    async createAudioRenderer(){
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

    async startRenderer(){
        try{
            await this.audioRenderer.start()
//            await globalThis.abilityContext.resourceManager.getRawFileDescriptor('test_44100_2.wav').then(value => {
//                this.fd = value.fd
//                Logger.info(this.tag, `fd : ${this.fd}`)
//                let fileDescriptor = {fd: value.fd, offset: value.offset, length: value.length};
//                Logger.info(this.tag, `getRawFileDescriptor success fileDescriptor:` + JSON.stringify(fileDescriptor) )
//            }).catch(error => {
//                console.log('case getRawFileDescriptor err: ' + error);
//            });
            globalThis.abilityContext.resourceManager.getRawFd("test_44100_2.wav").then(value => {
                this.fd = value.fd
				this.offset = value.offset
                Logger.info(this.tag, `getRawFd fd : ${this.fd}, offset: ${value.offset}, length: ${value.length}`)
            }).catch(err => {
                console.log(`getRawFd fail err: ${err}, message: ${err.message}, code: ${err.code}`);
            })

            let bufferSize = await this.audioRenderer.getBufferSize()
            Logger.info(this.tag, `audioRenderer bufferSize:` + JSON.stringify(bufferSize))
            let stat = await fs.stat(this.fd);
            let len = stat.size % bufferSize == 0 ? Math.floor(stat.size / bufferSize) : Math.floor(stat.size / bufferSize + 1);
            let buf = new ArrayBuffer(bufferSize);
            while (true) {
                for (let i = 0;i < len; i++) {
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
        }catch(err){
            Logger.info(this.tag, `startRenderer fail err: ${err}, message: ${err.message}, code: ${err.code}`)
        }
    }

    async stopRenderer(){
        try{
            await this.audioRenderer.stop()
        }catch(err){
            Logger.info(this.tag, `stopCapturer fail err: ${err}, message: ${err.message}, code: ${err.code}`)
        }
    }

    async releaseRenderer(){
        try{
            if (this.audioRenderer){
                await this.audioRenderer.release()
//                await globalThis.abilityContext.resourceManager.closeRawFileDescriptor('test_44100_2.wav').then(()=> {
//                    Logger.info(this.tag, `closeRawFileDescriptor success`)
//                }).catch(err => {
//                    Logger.info(this.tag, `closeRawFileDescriptor fail err: ${err}, message: ${err.message}, code: ${err.code}`)
//                });
                await globalThis.abilityContext.resourceManager.closeRawFd('test_44100_2.wav').then(()=> {
                    Logger.info(this.tag, `closeRawFileDescriptor success`)
                }).catch(err => {
                    Logger.info(this.tag, `closeRawFileDescriptor fail err: ${err}, message: ${err.message}, code: ${err.code}`)
                });
            }
        }catch(err){
            Logger.info(this.tag, `stopCapturer fail err: ${err}, message: ${err.message}, code: ${err.code}`)
        }
    }

}

export default new AudioRenderer()