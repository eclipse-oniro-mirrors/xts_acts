// @ts-nocheck
import media from '@ohos.multimedia.media'
import fs from '@ohos.file.fs'
import Logger from './Logger'

const TAG = 'qlw play'

export class mediaPlay {
    private avPlay: media.AVPlayer = undefined
    private surfaceId: number = -1
    public totalDuration: number
    private handleVideoPlayback: (isVideoPlayback: boolean) => void = false

    async getFileFd(name) {
        let filesDir = globalThis.abilityContext.filesDir
        let path = filesDir + '/' + name
        let file = fs.openSync(path)
        return file.fd
    }

    async getRawfileFd(name) {
        let file = await globalThis.abilityContext.resourceManager.getRawFd(name)
        return file.fd
    }

    getCurrentTime() {
        return 0
    }

    seek() {

    }

    async init(surfaceId?) {
        let fd
        if (surfaceId) {
            this.surfaceId = surfaceId
            fd = await this.getFileFd('test.mp4')
        } else {
            fd = await this.getFileFd('test.wav')
        }
        Logger.info(TAG, ` fd success : ${fd}`)
        this.avPlay = await media.createAVPlayer()
        this.setCallBack(this.avPlay)
        this.avPlay.url = 'fd://' + fd
    }

    async initVideo(surfaceId) {
        this.surfaceId = surfaceId
        let fd = await this.getRawfileFd('video.mp4')
        Logger.info(TAG, ` fd success : ${fd}`)
        this.avPlay = await media.createAVPlayer()
        this.setCallBack(this.avPlay)
        this.avPlay.url = 'fd://' + fd
    }

    async Play() {
        await this.avPlay.play()
    }

    setCallBack(AVPlayer) {
        AVPlayer.on('stateChange', async (state, reason) => {
            switch (state) {
                case 'idle':
                    Logger.info(TAG, 'state idle start')
                    break;
                case 'initialized':
                    Logger.info(TAG + 'state initialized start ')
                    if (this.surfaceId != -1) {
                        AVPlayer.surfaceId = String(this.surfaceId)
                    }
                    await AVPlayer.prepare()
                    Logger.info(TAG, 'state initialized end')
                    break;
                case 'prepared':
                    Logger.info(TAG, 'state prepared start')
                    await AVPlayer.play()
                    Logger.info(TAG, 'state prepared end')
                    break;
                case 'playing':
                    Logger.info(TAG, 'state playing callback')
                    break;
                case 'paused':
                    Logger.info(TAG, 'state paused callback')
                    break;
                case 'completed':
                    await AVPlayer.stop()
                    await AVPlayer.release()
					if (this.handleVideoPlayback) {
                        this.handleVideoPlayback(true)
                    }
                case 'error':
                    Logger.info(TAG, 'state error callback')
                    break;
            }
        })
        AVPlayer.on('error', (err) => {
            Logger.info(TAG, `state error callback err:${err},code:${err.code},message:${err.message}}`)
        })
    }
	
    setVideoPlaybackCallback(callback) {
        this.handleVideoPlayback = callback
    }

    async release(){
        if (this.avPlay){
            await this.avPlay.release()
            Logger.info(TAG, 'avplay release success')
        }
    }

    encodeWAV(sampleRateValue, sampleBitsValue, channelCountValue) {
        let sampleRate = sampleRateValue;
        let dataLen = sampleRate * 1000;
        let sampleBits = sampleBitsValue * 8 + 8 // 采样格式
        let channelCount = channelCountValue; // 单声道
        let offset = 0;
        let buffer = new ArrayBuffer(44);
        let data = new DataView(buffer);
        // 资源交换文件标识符
        this.writeString(data, offset, 'RIFF');
        offset += 4;
        // 下个地址开始到文件尾总字节数,即文件大小-8
        data.setUint32(offset, 36 + dataLen, true);
        offset += 4;
        // WAV文件标志
        this.writeString(data, offset, 'WAVE');
        offset += 4;
        // 波形格式标志
        this.writeString(data, offset, 'fmt ');
        offset += 4;
        // 过滤字节,一般为 0x10 = 16
        data.setUint32(offset, 16, true);
        offset += 4;
        // 格式类别 (PCM形式采样数据)
        data.setUint16(offset, 1, true);
        offset += 2;
        // 通道数
        data.setUint16(offset, channelCount, true);
        offset += 2;
        // 采样率,每秒样本数,表示每个通道的播放速度
        data.setUint32(offset, sampleRate, true);
        offset += 4;
        // 波形数据传输率 (每秒平均字节数) 单声道×每秒数据位数×每样本数据位/8
        data.setUint32(offset, channelCount * sampleRate * (sampleBits / 8), true);
        offset += 4;
        // 快数据调整数 采样一次占用字节数 单声道×每样本的数据位数/8
        data.setUint16(offset, channelCount * (sampleBits / 8), true);
        offset += 2;
        // 每样本数据位数
        data.setUint16(offset, sampleBits, true);
        offset += 2;
        // 数据标识符
        this.writeString(data, offset, 'data');
        offset += 4;
        // 采样数据总数,即数据总大小-44
        data.setUint32(offset, dataLen, true);
        offset += 4;
        return data;
    }

    writeString(data, offset, str) {
        for (let i = 0; i < str.length; i++) {
            data.setUint8(offset + i, str.charCodeAt(i));
        }
    }
}

export default new mediaPlay()

