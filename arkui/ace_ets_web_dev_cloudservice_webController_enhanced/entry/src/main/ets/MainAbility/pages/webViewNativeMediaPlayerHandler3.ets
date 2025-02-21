/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import media from '@ohos.multimedia.media';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import events_emitter from '@ohos.events.emitter';
import webview from '@ohos.web.webview';
import { BuilderNode, FrameNode, NodeController, NodeRenderType } from '@ohos.arkui.node';
import { UIContext } from '@ohos.arkui.UIContext';
import Utils from '../../test/Utils';
import JSON from '@ohos.util.json';

let isPlaying: Boolean = false
let isError: Boolean = false
let isRelease: Boolean = false
let handleRateList: number[] = []
let rateList: number[] = []
let seekList: number[] = []
let networkStateList: number[] = []
let durationList: number[] = []
let readyStateList: number[] = []
let mediaErrorState: number = 1
let mediaErrorTypeList: number[] = []
let timeUpdateList: number[] = []
let networkState: number = 0
let readyState: number = 0
let videoTime: number = 0
interface AVPlayerListener {
    onPlaying() : void
    onPaused() : void
    onDurationChanged(duration: number) : void
    onBufferedTimeChanged(buffered: number) : void
    onTimeUpdate(time: number) : void
    onEnded() : void
    onVolume (vol: number) : void
    onSeeking() : void
    onSeekFinished(seekDoneTime: number) : void
    onPlaybackRateChanged (playbackRate: number) : void
    onError(error: webview.MediaError, errorMessage: string) : void
    onVideoSizeChanged(width: number, height: number) : void
}

class AVPlayerDemo {
    private surfaceID: string = '';
    private isSeek: boolean = true;
    private fd: number = 0;
    private listener?: AVPlayerListener
    public avPlayer?: media.AVPlayer;

    setSfID(surfaceId: string) {
        this.surfaceID = surfaceId;
    }
    // 注册avplayer回调函数
    setAVPlayerCallback(avPlayer: media.AVPlayer, listener: AVPlayerListener) {
        this.listener = listener
        // seek操作结果回调函数
        avPlayer.on('seekDone', (seekDoneTime: number) => {
            console.info('AVPlayer seek succeeded, seek time is ${seekDoneTime}');
        })
        // error回调监听函数，当avPlayer在操作过程中出现错误时调用reset接口触发重置流程
        avPlayer.on('error', (err: BusinessError) => {
            console.error(`[BrowserShell] Invoke avPlayer failed, code is ${err.code}, message is ${err.message}`);
            listener?.onError(err.code,err.message);
            avPlayer.reset(); // 调用reset重置资源，触发idle状态
        })
        // volumeChange
        avPlayer.on('volumeChange', (vol:number) => {
            console.info('volumeChange success,and new volume is :' + vol)
            listener.onVolume && listener.onVolume(vol);
        })
        // 状态机变化回调函数
        avPlayer.on('stateChange', async (state: string, reason: media.StateChangeReason) => {
            switch (state) {
              case 'idle': // 成功调用reset接口后触发该状态机上报
                console.info('AVPlayer state idle called.');
                avPlayer.release(); // 调用release接口销毁实例对象
                break;
              case 'initialized': // avplayer 设置播放源后触发该状态上报
                console.info('AVPlayer state initialized called. ');
                avPlayer.surfaceId = this.surfaceID; // 设置显示画面，当播放的资源为纯音频时无需设置
                avPlayer.prepare();
                break;
              case 'prepared': // prepare调用成功后上报该状态机
                isPlaying = true
                console.info('AVPlayer state prepared called.');
                break;
              case 'playing': // play成功调用后触发该状态机上报
                isPlaying = true
                console.info('AVPlayer state playing called.');
                listener?.onPlaying();
                break;
              case 'paused': // pause成功调用后触发该状态机上报
                console.info('AVPlayer state paused called.');
                listener?.onPaused();
                break;
              case 'completed': // 播放结束后触发该状态机上报
                console.info('AVPlayer state completed called.');
                avPlayer.stop(); // 调用播放结束接口
                break;
              case 'stopped': // stop接口成功调用后触发该状态机上报
                console.info('AVPlayer state stopped called.');
                listener?.onEnded();
                break;
              case 'released':
                console.info('AVPlayer state released called.');
                break;
              default:
                console.info('AVPlayer state unknown called.');
                break;
            }
        })
        avPlayer.on('durationUpdate', (duration: number) => {
            console.info('AVPlayer state durationUpdate success,new duration is:' + duration)
            listener?.onDurationChanged(duration/1000);
        })
        avPlayer.on('seekDone', (seekDoneTime: number) => {
            console.info('seekDone success,and seek time is:' + seekDoneTime)
            listener?.onSeekFinished(seekDoneTime);
        })
        avPlayer.on('speedDone', (speed: number) => {
            console.info('AVPlayer state durationUpdate success,new speed is:' + speed)
            listener?.onPlaybackRateChanged(speed);
        })
        avPlayer.on('timeUpdate', (time: number) => {
            listener?.onTimeUpdate(time/1000);
        })
        avPlayer.on('bufferingUpdate', (infoType: media.BufferingInfoType, value: number) => {
            console.info('AVPlayer state bufferingUpdate success, and InfoType value is:' + infoType + ', value is :' + value)
            if (infoType == media.BufferingInfoType.BUFFERING_PERCENT) {
            }
            listener?.onBufferedTimeChanged(value);
        })
        avPlayer.on('videoSizeChange', (width: number, height: number) => {
            console.info('AVPlayer state onVideoSizeChange success, and width is:' + width + ', height is :' + height)
            listener?.onVideoSizeChanged(width, height);
        })
    }

    // 以下demo为通过url设置网络地址来实现播放直播码流的demo
    async avPlayerLiveDemo(url: string, listener: AVPlayerListener) {
        this.listener = listener
        // 创建avPlayer实例对象
        this.avPlayer = await media.createAVPlayer();
        // 创建状态机变化回调函数
        this.setAVPlayerCallback(this.avPlayer, listener);
        this.isSeek = true; // 不支持seek操作
        this.avPlayer.url = url;
    }

    // 以下demo为通过使用资源管理接口获取打包在HAP内的媒体资源文件并通过fdSrc属性进行播放示例
    async avPlayerFdSrcDemo(listener: AVPlayerListener) {
        // 创建avPlayer实例对象
        this.avPlayer = await media.createAVPlayer();
        // 创建状态机变化回调函数
        this.setAVPlayerCallback(this.avPlayer, listener);
        // 通过UIAbilityContext的resourceManager成员的getRawFd接口获取媒体资源播放地址
        // 返回类型为{fd,offset,length},fd为HAP包fd地址， offset为媒体资源拍你一辆，length为播放长度
        let context = getContext(this) as common.UIAbilityContext;
        let fileDescriptor = await context.resourceManager.getRawFd('mate50-pro-tvc.mp4');
        let avFileDescriptor: media.AVFileDescriptor =
            { fd: fileDescriptor.fd, offset: fileDescriptor.offset, length: fileDescriptor.length };
        this.isSeek = true; // 不支持seek操作
        // 为fdSrc赋值出发initialized状态机上报
        this.avPlayer.fdSrc = avFileDescriptor;
    }

    play() {
        console.info('AVPlayer.play()');
        this.avPlayer?.play()
    }
    pause() {
        console.info('AVPlayer.pause()');
        this.avPlayer?.pause()
    }
    release() {
        console.info('AVPlayer.release()');
        this.avPlayer?.release();
    }
    seek(time: number) {
        console.info('AVPlayer.seek (' + time + ')');
        this.listener?.onSeeking();
        this.avPlayer?.seek(time * 1000);
    }
    setVolume(number: number) {
        console.info('AVPlayer.setVolume(' + number + ')');
        this.avPlayer?.setVolume(number)
    }
    setSpeed(speed: number){
        this.avPlayer?.setSpeed(speed)
    }
}
class NativeMediaPlayerHandlerImpl implements webview.NativeMediaPlayerHandler {

    private rawHandler: webview.NativeMediaPlayerHandler;
    constructor(handler: webview.NativeMediaPlayerHandler) {
        this.rawHandler = handler
    }
    handleStatusChanged(status: webview.PlaybackStatus): void {
        console.log('handle PlaybackStatus:')
        this.rawHandler.handleStatusChanged(status)
    }

    handleVolumeChanged(volume: number): void {
        console.log('handle volume change :' + volume)
        this.rawHandler.handleVolumeChanged(volume)
    }

    handleMutedChanged(muted: boolean): void {
        console.log('handle muted:' + muted)
        this.rawHandler.handleMutedChanged(muted)
    }

    handlePlaybackRateChanged(playbackRate: number): void {
        console.log('handle playbackRate:' + playbackRate)
        rateList.push(playbackRate)
        handleRateList.push(playbackRate)
        if (playbackRate === 10) {
            Utils.emitEvent(true, 1800)
        }
        if (playbackRate === 2) {
            Utils.emitEvent(true, 1801)
            Utils.emitEvent(true, 1802)
        }
        if (playbackRate === 3) {
            Utils.emitEvent(true, 1803)
            Utils.emitEvent(true, 1804)
        }
        if (playbackRate === -1) {
            Utils.emitEvent(false, 1805)
            handleRateList.push(-1)
        }
        if (playbackRate === 1.2) {
            Utils.emitEvent(true, 1806)
            Utils.emitEvent(true, 1807)
        }
        this.rawHandler.handlePlaybackRateChanged(playbackRate)
    }

    handleDurationChanged(duration: number): void {
        console.log('handle duration :' + duration)
        Utils.emitEvent(true, 1812)
        durationList.push(duration)
        this.rawHandler.handleDurationChanged(duration)
    }

    handleTimeUpdate(currentPlayTime: number): void {
        Utils.emitEvent(true, 1813)
        console.log('handle currentPlayTime :' + currentPlayTime)
        this.rawHandler.handleTimeUpdate(currentPlayTime)
    }

    handleBufferedEndTimeChanged(bufferedEndTime: number): void {
        console.log('handle bufferedEndTime :' + bufferedEndTime)
        this.rawHandler.handleBufferedEndTimeChanged(bufferedEndTime)
    }

    handleEnded(): void {
        console.log('handle end:')
        this.rawHandler.handleEnded()
    }

    handleNetworkStateChanged(state: webview.NetworkState): void {
        console.log('handleNetworkStateChanged:' + state)
        networkStateList.push(state)
        if (webview.NetworkState.IDLE.toString() == '1') {
            Utils.emitEvent(true, 1819)
        }
        if (webview.NetworkState.LOADING.toString() == '2') {
            Utils.emitEvent(true, 1818)
        }

        if (networkState > 0) {
            this.rawHandler.handleNetworkStateChanged(networkState)
            networkStateList.push(networkState)
        } else {
            this.rawHandler.handleNetworkStateChanged(state)
            networkStateList.push(state)
        }

    }

    handleReadyStateChanged(state: webview.ReadyState): void {
        console.log('handleReadyStateChanged :' + state)
        readyStateList.push(state)

        if (webview.ReadyState.HAVE_METADATA.toString() == '1') {
            Utils.emitEvent(true, 1825)
        }
        if (webview.ReadyState.HAVE_CURRENT_DATA.toString() == '2') {
            Utils.emitEvent(true, 1826)
        }
        if (webview.ReadyState.HAVE_FUTURE_DATA.toString() == '3') {
            Utils.emitEvent(true, 1827)
        }
        if (webview.ReadyState.HAVE_ENOUGH_DATA.toString() == '4') {
            Utils.emitEvent(true, 1828)
        }
        if (readyState > 0) {
            console.log('readyStateList is:' + readyStateList)
            this.rawHandler.handleReadyStateChanged(1);
            this.rawHandler.handleReadyStateChanged(2);
            this.rawHandler.handleReadyStateChanged(3);
            this.rawHandler.handleReadyStateChanged(4);
            readyStateList.push(readyState)
        } else {
            this.rawHandler.handleReadyStateChanged(state)
        }
    }

    handleFullscreenChanged(fullscreen: boolean): void {
        console.log('handle fullscreen :' + fullscreen)
        this.rawHandler.handleFullscreenChanged(fullscreen)
    }

    handleSeeking(): void {
        console.log('handleSeeking:')
        this.rawHandler.handleSeeking()
    }

    handleSeekFinished(): void {
        console.log('handleSeekFinished:')
        this.rawHandler.handleSeekFinished()
    }

    handleError(error: webview.MediaError, errorMessage: string): void {
        console.log('handleError:' + 'mediaError' + error + ':' + errorMessage)
        console.log('[handleError] [' + mediaErrorTypeList + ']')
        isError = true
        mediaErrorTypeList.push(error)
        mediaErrorTypeList.push(mediaErrorState)
        mediaErrorTypeList.push(webview.MediaError.NETWORK_ERROR)
        mediaErrorTypeList.push(webview.MediaError.FORMAT_ERROR)
        mediaErrorTypeList.push(webview.MediaError.DECODE_ERROR)
        console.log('mediaErrorTypeList -->' + mediaErrorTypeList);
        this.rawHandler.handleError(error,errorMessage)
    }

    handleVideoSizeChanged(width: number, height: number): void {
        console.log('handleVideoSizeChanged:')
        Utils.emitEvent(true, 1808)
        this.rawHandler.handleVideoSizeChanged(width,height)
    }
}
class NativeMediaPlayerImpl implements webview.NativeMediaPlayerBridge{
    private surfaceId: string;
    public mediaSource: string;
    private mediaHandler: webview.NativeMediaPlayerHandler;
    public web: WebComponent;
    public nativePlayer?: AVPlayerDemo;

    constructor(web: WebComponent, handler: webview.NativeMediaPlayerHandler, videoInfo: webview.MediaInfo) {
        this.web = web;
        this.mediaHandler = handler;
        this.surfaceId = videoInfo.surfaceInfo.id;
        if (videoInfo.mediaSrcList) {
            this.mediaSource = videoInfo.mediaSrcList[0].source;
        } else {
            this.mediaSource = ''
        }

        this.web.nodeController = new MyNodeController(
            this.web, this.surfaceId, this.mediaHandler, this, NodeRenderType.RENDER_TYPE_TEXTURE)
        this.web.nodeController.rebuild()
        this.web.showNativeMediaPlayer = true;

        console.log('NativeMediaPlayerImpl.mediaSource : ' + this.mediaSource);
    }

    setNativePlayer(nativePlayer: AVPlayerDemo) {
        this.nativePlayer = nativePlayer;
    }

    updateRect(x: number, y: number, width: number, height: number): void {
        this.web.nodeWidth = width;
        this.web.nodeHeight = height;
    }
    play() {
        console.log('[BrowserShell] ===gpz=== MediaPlayer.play');
        this.nativePlayer?.play();
    }
    pause() {
        console.log('[BrowserShell] ===gpz=== MediaPlayer.pause');
        this.nativePlayer?.pause();
    }
    seek(targetTime: number) {
        console.log('[BrowserShell] ===gpz=== MediaPlayer.seek(' + targetTime + ')');
        seekList.push(targetTime)
        console.log('[BrowserShell] ===gpz=== videoTime(' + videoTime + ')');
        console.log('[BrowserShell] ===gpz=== seekList(' + seekList + ')');
        if (targetTime > 0 && targetTime === videoTime) {
            Utils.emitEvent(true, 1809)
        }
        if (targetTime === -1) {
            Utils.emitEvent(false, 1810)
        }
        if (targetTime === 20) {
            Utils.emitEvent(true, 1811)
        }
        this.nativePlayer?.seek(targetTime);
    }
    setVolume(volume: number) {
        console.log('[BrowserShell] ===gpz=== MediaPlayer.setVolume(' + volume + ')');
        this.web.nativeMediaPlayerHandlerImpl?.handleVolumeChanged(volume)
    }
    setMuted(muted: boolean) {
        console.log('[BrowserShell] ===gpz=== MediaPlayer.setMuted(' + muted + ')');
    }
    setPlaybackRate(playbackRate: number) {
        console.log('[BrowserShell] ===gpz=== MediaPlayer.playbackRate(' + playbackRate + ')');
        rateList.push(playbackRate)
        handleRateList.push(playbackRate)
        if (playbackRate === 10) {
            Utils.emitEvent(true, 1800)
        }
        if (playbackRate === 2) {
            Utils.emitEvent(true, 1801)
            Utils.emitEvent(true, 1802)
        }
        if (playbackRate === 3) {
            Utils.emitEvent(true, 1803)
            Utils.emitEvent(true, 1804)
        }
        if (playbackRate === -1) {
            Utils.emitEvent(false, 1805)
        }
        if (playbackRate === 1.2) {
            Utils.emitEvent(true, 1806)
            Utils.emitEvent(true, 1807)
        }
        this.nativePlayer?.setSpeed(playbackRate);
    }
    release() {
        console.log('[BrowserShell] ===gpz=== MediaPlayer.release');
        isRelease = true
        this.nativePlayer?.release();
        this.web.showNativeMediaPlayer = false;
    }
    enterFullscreen() {
        console.log('[BrowserShell] ===gpz=== MediaPlayer.enterFullscreen');
    }
    exitFullscreen() {
        console.log('[BrowserShell] ===gpz=== MediaPlayer.exitFullscreen');
    }

    resumePlayer() {

    }
    suspendPlayer(type: SuspendType) {

    }
}
enum SuspendType {

}

class AVPlayerListenerImpl implements AVPlayerListener {
    public handler: webview.NativeMediaPlayerHandler;
    public component: MyComponent;

    constructor(handler: webview.NativeMediaPlayerHandler, component: MyComponent) {
        this.handler = handler;
        this.component = component;
    }
    onPlaying() {
        console.log('[BrowserShell] onPlaying, handler[' + this.handler + ']')
        this.handler.handleStatusChanged(webview.PlaybackStatus.PLAYING);
        this.handler.handleNetworkStateChanged(webview.NetworkState.IDLE);
    }
    onSeeking() {
        console.log('[BrowserShell] onSeeking, handler[' + this.handler + ']')
        this.handler.handleSeeking();
    }
    onSeekFinished() {
        console.log('[BrowserShell] onSeekFinished, handler[' + this.handler + ']')
        this.handler.handleSeekFinished();
    }
    onPaused() {
        console.log('[BrowserShell] onPaused, handler[' + this.handler + ']')
        this.handler.handleStatusChanged(webview.PlaybackStatus.PAUSED);
        console.log('[BrowserShell] end onPaused');
    }
    onDurationChanged(duration: number) {
        console.log('[BrowserShell] onDurationChanged(' + duration + '), handler[' + this.handler + ']')
        videoTime = duration
        durationList.push(duration)
        Utils.emitEvent(true, 1812)
        this.handler.handleDurationChanged(duration);
        if (networkState > 0) {
            this.handler.handleNetworkStateChanged(networkState)
            networkStateList.push(networkState)
        } else {
            this.handler.handleNetworkStateChanged(webview.NetworkState.LOADING);
            networkStateList.push(2)
        }
    }
    onPlaybackRateChanged(speed: number) {
        console.log('[BrowserShell] onPlaybackRateChanged(' + speed + '), handler[' + this.handler + ']')
        this.handler.handlePlaybackRateChanged(speed);
    }
    onVolume(vol: number): void {
        console.log('[BrowserShell] onVolume(' + vol + '), handler[' + this.handler + ']')
        this.handler.handleVolumeChanged(vol);
    }
    onBufferedTimeChanged(buffered: number) {
        console.log('[BrowserShell] onBufferedTimeChanged(' + buffered + '), handler[' + this.handler + ']')
        Utils.emitEvent(buffered == 0, 1814)
        this.handler.handleBufferedEndTimeChanged(buffered);
    }
    onTimeUpdate(time: number) {
        console.log('[BrowserShell] onTimeUpdate(' + time + '), handler[' + this.handler + ']')
        Utils.emitEvent(true, 1813)
        this.handler.handleTimeUpdate(time);
        timeUpdateList.push(time)
        this.handler.handleReadyStateChanged(webview.ReadyState.HAVE_METADATA);
        if (readyState > 0) {
            this.handler.handleReadyStateChanged(1);
            this.handler.handleReadyStateChanged(2);
            this.handler.handleReadyStateChanged(3);
            this.handler.handleReadyStateChanged(4);
        }
    }
    onEnded() {
        console.log('[BrowserShell] onEnded(), handler[' + this.handler + ']')
        console.log('stopped' + webview.MediaPlaybackState.STOPPED.toString())
        console.log('stopped after')
        this.handler.handleEnded();
    }
    onError() {
        console.log('[BrowserShell] onError(), handler[' + this.handler + ']')
        console.log('MediaError' + webview.MediaError.NETWORK_ERROR.toString())
        networkStateList.push(webview.NetworkState.NETWORK_ERROR)
        mediaErrorTypeList.push(webview.MediaError.NETWORK_ERROR)
        mediaErrorTypeList.push(webview.MediaError.FORMAT_ERROR)
        mediaErrorTypeList.push(webview.MediaError.DECODE_ERROR)
        Utils.emitEvent(true, 1820)
        this.handler.handleNetworkStateChanged(webview.NetworkState.NETWORK_ERROR);
        isError = true
        this.handler.handleError(webview.MediaError.NETWORK_ERROR, 'Oops!');
        this.handler.handleError(webview.MediaError.FORMAT_ERROR, 'Oops!');
        this.handler.handleError(webview.MediaError.DECODE_ERROR, 'Oops!');
    }
    onVideoSizeChanged(width: number, height: number) {
        console.log('[BrowserShell] onVideoSizeChanged(' + width + ',' + height + '), handler[' + this.handler + ']')
        Utils.emitEvent(true, 1808)
        this.handler.handleVideoSizeChanged(width, height);
        this.component.onSizeChanged(width, height);
    }
}

interface Params {
    text: string
    text2: string
    webTab: WebComponent
    handler: webview.NativeMediaPlayerHandler
    player: NativeMediaPlayerImpl
}

@Component
struct MyComponent {
    params?: Params
    @State bkColor: Color = Color.Red
    mXComponentController: XComponentController = new XComponentController();
    @State playerChanged: boolean = false;
    @Builder static ButtonBuilder(params: Params) {
    MyComponent({ params: params })
        .backgroundColor(Color.Green)
        .border({ width: 1, color: Color.Brown })
        .width('100%')
        .height('100%')
    }
    videoController: VideoController = new VideoController();
    player?: AVPlayerDemo
    offsetX: number = 0
    offsetY: number = 0
    @State videoWidthPercent: number = 100;
    @State videoHeightPercent: number = 100;
    viewWidth: number = 0;
    viewHeight: number = 0;
    videoWidth: number = 0;
    videoHeight: number = 0;
    componentType:XComponentType = XComponentType.SURFACE;
    fullscreen: boolean = false;

    onSizeChanged(width: number, height: number) {
        this.videoWidth = width;
        this.videoHeight = height;
        let scale: number = this.viewWidth / width;
        let scaledVideoHeight: number = scale * height;
        this.videoHeightPercent = scaledVideoHeight / this.viewHeight * 100;
    }

    build() {
        Column() {
            Stack() {
                XComponent({ id: 'video_player_id', type: this.componentType,
                    controller: this.mXComponentController })
                    .width(this.videoWidthPercent + '%')
                    .height(this.videoHeightPercent + '%')
                    .border({ width: 1, color: Color.Red })
                    .onLoad(() => {
                        if (!this.params) {
                            console.log('this.params is null');
                            return;
                        }
                        this.player = new AVPlayerDemo();
                        this.params.player?.setNativePlayer(this.player);
                        this.player.setSfID(this.mXComponentController.getXComponentSurfaceId());
                        this.playerChanged = !this.playerChanged;

                        this.player.avPlayerLiveDemo(
                            this.params.player.mediaSource,
                            new AVPlayerListenerImpl(this.params.handler, this));
                    })
                Column() {
                    Row() {
                        Button(this.params?.text)
                            .height(50)
                            .border({ width: 2, color: Color.Red })
                            .backgroundColor(this.bkColor)
                            .onClick(() => {
                                console.log('[BrowserShell] Button[' + this.params?.text + '] is clicked');
                                this.player?.play();
                            })
                            .onTouch((event: TouchEvent) => {
                                event.stopPropagation();
                            })
                        Button(this.params?.text2)
                            .height(50)
                            .border({ width: 2, color: Color.Red })
                            .backgroundColor(this.bkColor)
                            .onClick(() => {
                                console.log('[BrowserShell] Button[' + this.params?.text2 + '] is clicked');
                                this.player?.pause();
                            })
                            .onTouch((event: TouchEvent) => {
                                event.stopPropagation();
                            })
                        Button('ToggleFullScreen')
                            .height(50)
                            .border({ width: 2, color: Color.Red })
                            .onClick(() => {
                                console.log('[BrowserShell] Button[ToggleFullScreen] is clicked');
                                this.fullscreen = !this.fullscreen;
                                if (!this.params) {
                                    return;
                                }
                                if (this.params.handler.handleFullscreenChanged) {
                                    this.params.handler.handleFullscreenChanged(this.fullscreen);
                                } else {
                                    this.params.handler['handleFullScreenChanged'](this.fullscreen);
                                }
                            })
                            .onTouch((event: TouchEvent) => {
                                event.stopPropagation();
                            })
                    }
                    .width('100%')
                    .justifyContent(FlexAlign.SpaceEvenly)
                    Row() {
                        Slider({
                            value: 100,
                            step: 10,
                            style: SliderStyle.InSet,
                            direction: Axis.Vertical,
                            reverse: true
                        })
                            .margin(10)
                            .showSteps(true)
                            .onTouch((event: TouchEvent) => {
                                event.stopPropagation();
                            })

                        Slider({
                            value: 50,
                            step: 10,
                            style: SliderStyle.InSet,
                            direction: Axis.Vertical,
                        })
                            .margin(10)
                            .showSteps(true)
                            .onTouch((event: TouchEvent) => {
                                event.stopPropagation();
                            })
                    }
                    .width('100%')
                    .justifyContent(FlexAlign.SpaceBetween)
                }
            }
        }
        .width('100%')
        .height('100%')
        .onTouchIntercept((event : TouchEvent) => {
            console.log('[BrowserShell] 2 onTouchIntercept');
            return HitTestMode.None
        })
        .onAreaChange((oldValue: Area, newValue: Area) => {
            this.viewWidth = parseFloat(newValue.width.toString())
            this.viewHeight = parseFloat(newValue.height.toString())

            this.onSizeChanged(this.videoWidth, this.videoHeight);
        })
    }
}

class MyNodeController extends NodeController {
    private rootNode: BuilderNode<[Params]> | undefined;
    private surfaceId_: string;
    private renderType_: NodeRenderType
    public webTab: WebComponent
    public listener: webview.NativeMediaPlayerHandler
    public player: NativeMediaPlayerImpl

    constructor(webTab: WebComponent, surfaceId: string, listener: webview.NativeMediaPlayerHandler,
        player: NativeMediaPlayerImpl, renderType: NodeRenderType) {
        super()
        this.webTab = webTab;
        this.listener = listener;
        this.player = player;
        this.surfaceId_ = surfaceId
        this.renderType_ = renderType
    }

    makeNode(uIContext: UIContext): FrameNode | null {
        this.rootNode = new BuilderNode(uIContext as UIContext, { surfaceId: this.surfaceId_, type: this.renderType_ });
        this.build()
        if (this.rootNode) {
            return this.rootNode.getFrameNode() as FrameNode;
        }
        return null;
    }
    build() {
        if (this.rootNode) {
            this.rootNode.build(new WrappedBuilder(MyComponent.ButtonBuilder),
                {'text': 'play', 'text2': 'pause', webTab:this.webTab, handler: this.listener, player: this.player})
        }
    }
}

interface PageBeginParam {
    url: string
}

@Entry
@Component
struct WebComponent {
    controller: WebviewController = new webview.WebviewController();
    nativePlayer? : webview.NativeMediaPlayerBridge
    nodeController?: MyNodeController
    nativeMediaPlayerHandlerImpl?: NativeMediaPlayerHandlerImpl
    mediaInfo?: webview.MediaInfo
    @State showNativeMediaPlayer: boolean = false;
    @State nodeWidth : number = 300;
    @State nodeHeight : number = 150;
    @State isShouldOverlay : boolean = true;
    @State isCallback : boolean = true;

    area?: Area
    @State emitKey: string = '';

    onPageShow() {
        let valueChangeEvent: events_emitter.InnerEvent = {
            eventId: 10,
            priority: events_emitter.EventPriority.LOW
        }
        events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
    }

    private valueChangeCallBack = (eventData: events_emitter.EventData) => {
        if (eventData != null) {
            console.info('valueChangeCallBack:' + JSON.stringify(eventData));
            if (eventData.data != null && eventData.data.ACTION != null) {
                this.emitKey = eventData.data.ACTION;
            }
        }
    }

    private retryPlayingGen = (emitKey: string) => {
        return async () => {
            let retryTime = 1
            while(retryTime < 5 && !isPlaying) {
                if (emitKey != this.emitKey) {
                    console.log( 'not same key:' + emitKey + ' new emitKey:' + this.emitKey )
                    return
                }
                if(!isPlaying) {
                    console.log('retry playing' + this.emitKey)
                    if(retryTime < 3) {
                        if (emitKey != this.emitKey) {
                            console.log( 'not same key:' + emitKey + ' new emitKey:' + this.emitKey )
                            return
                        }
                        console.log('buttonLoadTime:' + retryTime)
                        if (emitKey === this.emitKey) {
                            await this.controller.runJavaScript('buttonLoad()')
                        }
                    } else {
                        if (emitKey != this.emitKey) {
                            console.log( 'not same key:' + emitKey + ' new emitKey:' + this.emitKey )
                            return
                        }
                        console.log('retry refresh:' + this.emitKey)
                        console.log('freshRetryTime:' + retryTime)
                        this.controller.refresh()
                    }
                    await Utils.sleep(2000)
                    await this.controller.runJavaScript('buttonPlay()')
                    await this.controller.runJavaScript('setCurrentTime()')

                    await Utils.sleep(2000)
                } else {
                    console.log('retry success')
                }
                retryTime += 1
            }
            if(!isPlaying) {
                await this.controller.runJavaScript('buttonLoad()')
                await Utils.sleep(1000)
                await this.controller.runJavaScript('buttonPlay()')
                await this.controller.runJavaScript('setCurrentTime()')
            }
        }
    }

    build() {
        Column() {
            Row() {
                Button('NativeMediaPlayerRateHandler3').key('webViewNativeMediaPlayerRateHandler3').onClick(async () => {
                    console.info('key==>' + this.emitKey)
                    isPlaying = false
                    isError = false
                    videoTime = 0
                    readyState = 0
                    this.isShouldOverlay = true
                    this.isCallback = false
                    await Utils.sleep(2000)
                    if (Utils.isPC(this.controller) ) {
                        Utils.emitEvent(true, 1800)
                        Utils.emitEvent(true, 1801)
                        Utils.emitEvent(true, 1802)
                        Utils.emitEvent(true, 1803)
                        Utils.emitEvent(true, 1804)
                        Utils.emitEvent(true, 1805)
                        Utils.emitEvent(true, 1806)
                        Utils.emitEvent(true, 1807)
                        Utils.emitEvent(true, 1812)
                        Utils.emitEvent(true, 1813)
                        Utils.emitEvent(true, 1815)
                        Utils.emitEvent(true, 1816)
                        Utils.emitEvent(true, 1817)
                        Utils.emitEvent(true, 1818)
                        Utils.emitEvent(true, 1819)
                        Utils.emitEvent(true, 1820)
                        Utils.emitEvent(true, 1821)
                        Utils.emitEvent(true, 1822)
                        Utils.emitEvent(true, 1823)
                        Utils.emitEvent(true, 1824)
                        Utils.emitEvent(true, 1825)
                        Utils.emitEvent(true, 1826)
                        Utils.emitEvent(true, 1827)
                        Utils.emitEvent(true, 1828)
                        return
                    }
                    switch (this.emitKey) {
                      case 'emitWebViewNativeMediaPlayerSetPlayRateNegative1': {
                        this.controller.loadUrl($rawfile('nativeMediaPlayerHandlerSetPlayRate.html'))
                        await Utils.sleep(3000)
                        this.controller.runJavaScript('buttonPlay()', (error, result) => {
                            console.error(`The buttonPlay() return error is: ${error}`);
                            console.log(`The buttonPlay() return value is: ${result}`);
                        })
                        await Utils.sleep(500)
                        this.controller.runJavaScript('setPlaybackRate(3)', (error, result) => {
                            console.log(`The setPlaybackRate(3) return value is: ${error}`);
                            console.log(`The setPlaybackRate(3) return value is: ${result}`);
                        })
                        await Utils.sleep(500)
                        this.controller.runJavaScript('setPlaybackRate(1.2)', (error, result) => {
                            console.log(`The setPlaybackRate() return value is: ${result}`);
                            console.log(`The setPlaybackRate() return value is: ${error}`);
                        })
                        await Utils.sleep(1000)
                        await this.retryPlayingGen(this.emitKey)()
                        this.controller.runJavaScript('setPlaybackRate(-1)', (error, result) => {
                            console.log(`The setPlaybackRate() return value is: ${result}`);
                            console.log(`The setPlaybackRate() return value is: ${error}`);
                        })
                        await Utils.sleep(1000)
                        console.log('video is playing:' + isPlaying)
                        if(rateList.indexOf(-1)>-1){
                            Utils.emitEvent(false, 1805)
                        }else{
                            Utils.emitEvent(true, 1805)
                        }
                        break;
                      }
                      case 'emitWebViewNativeMediaPlayerSetPlayRate10': {
                        this.controller.loadUrl($rawfile('nativeMediaPlayerHandlerSetPlayRate.html'))
                        await Utils.sleep(3000)
                        this.controller.runJavaScript('buttonPlay()', (error, result) => {
                            console.error(`The buttonPlay() return error is: ${error}`);
                            console.log(`The buttonPlay() return value is: ${result}`);
                        })
                        await Utils.sleep(1000)
                        await this.retryPlayingGen(this.emitKey)()
                        await Utils.sleep(1000)
                        this.controller.runJavaScript('setPlaybackRate(3)', (error, result) => {
                            console.log(`The setPlaybackRate(3) return value is: ${error}`);
                            console.log(`The setPlaybackRate(3) return value is: ${result}`);
                        })
                        await Utils.sleep(500)
                        this.controller.runJavaScript('setPlaybackRate(2)', (error, result) => {
                            console.log(`The setPlaybackRate(2) return value is: ${error}`);
                            console.log(`The setPlaybackRate(2) return value is: ${result}`);
                        })
                        await Utils.sleep(1000)
                        this.controller.runJavaScript('setPlaybackRate(10)', (error, result) => {
                            console.log(`The setPlaybackRate(10) return value is: ${error}`);
                            console.log(`The setPlaybackRate(10) return value is: ${result}`);
                        })
                        await Utils.sleep(2000)
                        console.log('video is playing:' + isPlaying);
                        if(handleRateList.indexOf(10)>-1){
                            Utils.emitEvent(true, 1800)
                        }else{
                            Utils.emitEvent(false, 1800)
                        }
                        break;
                      }
                      case 'emitWebViewNativeMediaPlayerSetPlayRate2':
                      case 'emitWebViewNativeMediaPlayerSetPlayRate2_handleRateChange': {
                        this.controller.loadUrl($rawfile('nativeMediaPlayerHandlerSetPlayRate.html'))
                        await Utils.sleep(2000)
                        this.controller.runJavaScript('buttonPlay()', (error, result) => {
                            console.error(`The buttonPlay() return error is: ${error}`);
                            console.log(`The buttonPlay() return value is: ${result}`);
                        })
                        await Utils.sleep(1000)
                        await this.retryPlayingGen(this.emitKey)()
                        await Utils.sleep(1000)
                        this.controller.runJavaScript('setPlaybackRate(3)', (error, result) => {
                            console.log(`The setPlaybackRate(3) return value is: ${error}`);
                            console.log(`The setPlaybackRate(3) return value is: ${result}`);
                        })
                        await Utils.sleep(500)
                        this.controller.runJavaScript('setPlaybackRate(2)', (error, result) => {
                            console.log(`The setPlaybackRate(2) return value is: ${error}`);
                            console.log(`The setPlaybackRate(2) return value is: ${result}`);
                        })
                        await Utils.sleep(1000)
                        console.log('video is playing:' + isPlaying)
                        if(rateList.indexOf(2)>-1){
                            Utils.emitEvent(true, 1801)
                        }
                        if(handleRateList.indexOf(2)>-1){
                            Utils.emitEvent(true, 1802)
                        }
                        break;
                      }
                      case 'emitWebViewNativeMediaPlayerSetPlayRate3':
                      case 'emitWebViewNativeMediaPlayerSetPlayRate3_handleRateChange': {
                        this.controller.loadUrl($rawfile('nativeMediaPlayerHandlerSetPlayRate.html'))
                        await Utils.sleep(3000)
                        this.controller.runJavaScript('buttonPlay()', (error, result) => {
                            console.error(`The buttonPlay() return error is: ${error}`);
                            console.log(`The buttonPlay() return value is: ${result}`);
                        })
                        await Utils.sleep(1000)
                        await this.retryPlayingGen(this.emitKey)()
                        await Utils.sleep(1000)
                        this.controller.runJavaScript('setPlaybackRate(1.2)', (error, result) => {
                            console.log(`The setPlaybackRate(1.2) return value is: ${result}`);
                            console.log(`The setPlaybackRate() return value is: ${error}`);
                        })
                        await Utils.sleep(500)
                        this.controller.runJavaScript('setPlaybackRate(3)', (error, result) => {
                            console.log(`The setPlaybackRate(3) return value is: ${result}`);
                            console.log(`The setPlaybackRate() return value is: ${error}`);
                        })
                        await Utils.sleep(1000)
                        console.log('video is playing:' + isPlaying)
                        if(rateList.indexOf(3)>-1){
                            Utils.emitEvent(true, 1803)
                        }
                        if(handleRateList.indexOf(3)>-1){
                            Utils.emitEvent(true, 1804)
                        }
                        break;
                      }
                      case 'emitWebViewNativeMediaPlayerSetPlayRate1_point_2':
                      case 'emitWebViewNativeMediaPlayerSetPlayRate1_point_2_handleRateChange': {
                        this.controller.loadUrl($rawfile('nativeMediaPlayerHandlerSetPlayRate.html'))
                        await Utils.sleep(3000)
                        this.controller.runJavaScript('buttonPlay()', (error, result) => {
                            console.error(`The buttonPlay() return error is: ${error}`);
                            console.log(`The buttonPlay() return value is: ${result}`);
                        })
                        await Utils.sleep(1000)
                        await this.retryPlayingGen(this.emitKey)()
                        await Utils.sleep(1000)
                        this.controller.runJavaScript('setPlaybackRate(1.2)', (error, result) => {
                            console.log(`The setPlaybackRate() return value is: ${error}`);
                            console.log(`The setPlaybackRate() return value is: ${result}`);
                        })
                        await Utils.sleep(1000)
                        console.log('video is playing:' + isPlaying)
                        if(rateList.indexOf(1.2)>-1){
                            Utils.emitEvent(true, 1806)
                        }
                        if(handleRateList.indexOf(1.2)>-1){
                            Utils.emitEvent(true, 1807)
                        }
                        break;
                      }
                      case 'emitWebViewNativeMediaPlayerHandleVideoSizeChange': {
                        this.controller.loadUrl($rawfile('nativeMediaPlayerHandlerSetPlayRate.html'))
                        await Utils.sleep(5000)
                        this.controller.runJavaScript('buttonPlay()', (error, result) => {
                            console.error(`The buttonPlay() return error is: ${error}`);
                            console.log(`The buttonPlay() return value is: ${result}`);
                        })
                        await this.retryPlayingGen(this.emitKey)()
                        await Utils.sleep(1000)
                        this.controller.runJavaScript('resize()', (error, result) => {
                            console.error(`The resize() return error is: ${error}`);
                            console.log(`The resize() return value is: ${result}`);
                        })
                        console.log('video is playing:' + isPlaying)
                        break;
                      }
                      case 'emitWebViewNativeMediaPlayerSeekNegative1': {
                        this.controller.loadUrl($rawfile('multi_source_video_seek.html'))
                        await Utils.sleep(5000)
                        this.controller.runJavaScript('buttonPlay()', (error, result) => {
                            console.error(`The buttonPlay() return error is: ${error}`);
                            console.log(`The buttonPlay() return value is: ${result}`);
                        })
                        await this.retryPlayingGen(this.emitKey)()
                        await Utils.sleep(1000)
                        this.controller.runJavaScript('setSeek(20)', (error, result) => {
                            console.error(`The setSeek(20) return error is: ${error}`);
                            console.log(`The setSeek(20) return value is: ${result}`);
                        })
                        await Utils.sleep(1000)
                        this.controller.runJavaScript('setSeek(-1)', (error, result) => {
                            console.error(`The setSeek(-1) return error is: ${error}`);
                            console.log(`The setSeek(-1) return value is: ${result}`);
                        })
                        await Utils.sleep(2000)
                        console.log('video is playing:' + isPlaying)
                        if (seekList.indexOf(-1) > -1){
                            Utils.emitEvent(false, 1810)
                        }else {
                            Utils.emitEvent(true, 1810)
                        }
                        break;
                      }
                      case 'emitWebViewNativeMediaPlayerPreloadAuto': {
                        this.controller.loadUrl($rawfile('nativeMediaPlayerHandlerPreloadAuto.html'))
                        await Utils.sleep(5000)
                        this.controller.runJavaScript('buttonPlay()', (error, result) => {
                            console.error(`The buttonPlay() return error is: ${error}`);
                            console.log(`The buttonPlay() return value is: ${result}`);
                        })
                        await this.retryPlayingGen(this.emitKey)()
                        await Utils.sleep(2000)
                        console.log('video is playing:' + isPlaying)
                        if (durationList.length > 0) {
                            Utils.emitEvent(true, 1812)
                        }
                        break;
                      }
                      case 'emitWebViewNativeMediaPlayerTimeUpdate': {
                        this.controller.loadUrl($rawfile('nativeMediaPlayerHandlerSetPlayRate.html'))
                        await Utils.sleep(8000)
                        this.controller.runJavaScript('buttonPlay()', (error, result) => {
                            console.error(`The buttonPlay() return error is: ${error}`);
                            console.log(`The buttonPlay() return value is: ${result}`);
                        })
                        await this.retryPlayingGen(this.emitKey)()
                        await Utils.sleep(2000)
                        if (timeUpdateList.length > 0) {
                            Utils.emitEvent(true, 1813)
                        }
                        console.log('video is playing:' + isPlaying)
                        break;
                      }
                      case 'emitWebViewNativeMediaPlayerBufferedEndTime': {
                        this.controller.loadUrl($rawfile('nativeMediaPlayerHandlerSetPlayRate.html'))
                        await Utils.sleep(8000)
                        this.controller.runJavaScript('buttonPlay()', (error, result) => {
                            console.error(`The buttonPlay() return error is: ${error}`);
                            console.log(`The buttonPlay() return value is: ${result}`);
                        })
                        await this.retryPlayingGen(this.emitKey)()
                        await Utils.sleep(1000)
                        console.log('video is playing:' + isPlaying)
                        break;
                      }
                      case 'emitWebViewNativeMediaPlayerFormatError': {
                        mediaErrorState = 2
                        this.controller.loadUrl($rawfile('nativeMediaError.html'))
                        await Utils.sleep(2000)
                        this.controller.runJavaScript('buttonPlay()', (error, result) => {
                            console.error(`The buttonPlay() return error is: ${error}`);
                            console.log(`The buttonPlay() return value is: ${result}`);
                        })
                        await Utils.sleep(1000)
                        console.log(`The isRelease: ${isRelease}`);
                        console.log(`The mediaErrorTypeList: ${mediaErrorTypeList}`);
                        console.log(`The isError: ${isError}`);
                        if (isError && isRelease && mediaErrorTypeList.indexOf(2) > -1) {
                            Utils.emitEvent(true, 1815)
                        }
                        break;
                      }
                      case 'emitWebViewNativeMediaPlayerNetError': {
                        mediaErrorState = 1
                        this.controller.loadUrl($rawfile('nativeMediaError.html'))
                        await Utils.sleep(2000)
                        this.controller.runJavaScript('buttonPlay()', (error, result) => {
                            console.error(`The buttonPlay() return error is: ${error}`);
                            console.log(`The buttonPlay() return value is: ${result}`);
                        })
                        await Utils.sleep(1000)
                        console.log(`The isRelease: ${isRelease}`);
                        console.log(`The mediaErrorTypeList: ${mediaErrorTypeList}`);
                        console.log(`The isError: ${isError}`);
                        if (isError && isRelease && mediaErrorTypeList.indexOf(1) > -1) {
                            Utils.emitEvent(true, 1816)
                        }
                        break;
                      }
                      case 'emitWebViewNativeMediaPlayerDecodeError': {
                        mediaErrorState = 3
                        this.controller.loadUrl($rawfile('nativeMediaError.html'))
                        await Utils.sleep(2000)
                        this.controller.runJavaScript('buttonPlay()', (error, result) => {
                            console.error(`The buttonPlay() return error is: ${error}`);
                            console.log(`The buttonPlay() return value is: ${result}`);
                        })
                        await Utils.sleep(1000)
                        console.log(`The isRelease: ${isRelease}`);
                        console.log(`The mediaErrorTypeList: ${mediaErrorTypeList}`);
                        console.log(`The isError: ${isError}`);
                        if (isError && isRelease && mediaErrorTypeList.indexOf(3) > -1) {
                            Utils.emitEvent(true, 1817)
                        }
                        break;
                      }
                      case 'emitWebViewNativeMediaPlayerNetworkStateLoading': {
                        networkState = 2
                        this.controller.loadUrl($rawfile('nativeMediaPlayerHandlerSetPlayRate.html'))
                        await Utils.sleep(10000)
                        this.controller.runJavaScript('buttonPlay()', (error, result) => {
                            console.error(`The buttonPlay() return error is: ${error}`);
                            console.log(`The buttonPlay() return value is: ${result}`);
                        })
                        await Utils.sleep(1000)
                        await this.retryPlayingGen(this.emitKey)()
                        await Utils.sleep(1000)
                        console.info('Loading networkStateList.indexOf(2) is: ' + networkStateList.indexOf(2))
                        console.log('video is playing:' + isPlaying)
                        if (networkStateList.indexOf(2) > -1){
                            Utils.emitEvent(true, 1818)
                        }else {
                            Utils.emitEvent(false, 1818)
                        }
                        break;
                      }
                      case 'emitWebViewNativeMediaPlayerNetworkStateIdle': {
                        networkState = 1
                        this.controller.loadUrl($rawfile('nativeMediaPlayerHandlerSetPlayRate.html'))
                        await Utils.sleep(8000)
                        this.controller.runJavaScript('buttonPlay()', (error, result) => {
                            console.error(`The buttonPlay() return error is: ${error}`);
                            console.log(`The buttonPlay() return value is: ${result}`);
                        })
                        await Utils.sleep(1000)
                        await this.retryPlayingGen(this.emitKey)()
                        await Utils.sleep(1000)
                        console.log('video is playing:' + isPlaying)
                        console.info('Idle networkStateList.indexOf(1) is: ' + networkStateList.indexOf(1))
                        if (networkStateList.indexOf(1) > -1){
                            Utils.emitEvent(true, 1819)
                        }else {
                            Utils.emitEvent(false, 1819)
                        }
                        break;
                      }
                      case 'emitWebViewNativeMediaPlayerNetworkStateError': {
                        networkState = 3
                        this.controller.loadUrl($rawfile('nativeMediaError.html'))
                        await Utils.sleep(1000)
                        this.controller.runJavaScript('buttonPlay()', (error, result) => {
                            console.error(`The buttonPlay() return error is: ${error}`);
                            console.log(`The buttonPlay() return value is: ${result}`);
                        })
                        await Utils.sleep(1000)
                        console.info('Error networkStateList.indexOf(3) is: ' + networkStateList.indexOf(3))
                        if (networkStateList.indexOf(3) > -1){
                            Utils.emitEvent(true, 1820)
                        }else {
                            Utils.emitEvent(false, 1820)
                        }
                        break;
                      }
                      case 'emitWebViewNativeMediaPlayerUpdateRect_1':
                      case 'emitWebViewNativeMediaPlayerUpdateRect_2':
                      case 'emitWebViewNativeMediaPlayerUpdateRect_3':
                      case 'emitWebViewNativeMediaPlayerUpdateRect_4': {
                        this.controller.loadUrl($rawfile('nativeMediaPlayerHandlerUpdateRect.html'))
                        await Utils.sleep(3000)
                        this.controller.runJavaScript('buttonPlay()', (error, result) => {
                            console.error(`The buttonPlay() return error is: ${error}`);
                            console.log(`The buttonPlay() return value is: ${result}`);
                        })
                        await Utils.sleep(2000)
                        await this.retryPlayingGen(this.emitKey)()
                        this.controller.runJavaScript('setPlaybackRate(10)', (error, result) => {
                            console.log(`The setPlaybackRate() return value is: ${error}`);
                            console.log(`The setPlaybackRate() return value is: ${result}`);
                        })
                        await Utils.sleep(1000)
                        this.controller.runJavaScript('setPlaybackRate(2)', (error, result) => {
                            console.log(`The setPlaybackRate() return value is: ${error}`);
                            console.log(`The setPlaybackRate() return value is: ${result}`);
                        })
                        await Utils.sleep(1000)
                        console.log('video is playing:' + isPlaying)
                        break;
                      }
                      case 'emitWebViewNativeMediaPlayerReadyState_1': {
                        readyState = 1
                        this.controller.loadUrl($rawfile('nativeMediaPlayerHandlerPreloadAuto.html'))
                        await Utils.sleep(8000)
                        this.controller.runJavaScript('buttonPlay()', (error, result) => {
                            console.error(`The buttonPlay() return error is: ${error}`);
                            console.log(`The buttonPlay() return value is: ${result}`);
                        })
                        await Utils.sleep(2000)
                        await this.retryPlayingGen(this.emitKey)()
                        await Utils.sleep(1000)
                        console.log('emitWebViewNativeMediaPlayerReadyState_1 video is playing:' + isPlaying)
                        if (readyStateList.indexOf(1) > -1){
                            Utils.emitEvent(true, 1825)
                        }else {
                            Utils.emitEvent(false, 1825)
                        }
                        break;
                      }
                      case 'emitWebViewNativeMediaPlayerReadyState_2': {
                        readyState = 2
                        this.controller.loadUrl($rawfile('nativeMediaPlayerHandlerPreloadAuto.html'))
                        await Utils.sleep(8000)
                        this.controller.runJavaScript('buttonPlay()', (error, result) => {
                            console.error(`The buttonPlay() return error is: ${error}`);
                            console.log(`The buttonPlay() return value is: ${result}`);
                        })
                        await Utils.sleep(2000)
                        await this.retryPlayingGen(this.emitKey)()
                        await Utils.sleep(1000)
                        if (readyStateList.indexOf(2) > -1){
                            Utils.emitEvent(true, 1826)
                        }else {
                            Utils.emitEvent(false, 1826)
                        }
                        break;
                      }
                      case 'emitWebViewNativeMediaPlayerReadyState_3': {
                        readyState = 3
                        this.controller.loadUrl($rawfile('nativeMediaPlayerHandlerPreloadAuto.html'))
                        await Utils.sleep(8000)
                        this.controller.runJavaScript('buttonPlay()', (error, result) => {
                            console.error(`The buttonPlay() return error is: ${error}`);
                            console.log(`The buttonPlay() return value is: ${result}`);
                        })
                        await Utils.sleep(2000)
                        await this.retryPlayingGen(this.emitKey)()
                        await Utils.sleep(1000)
                        if (readyStateList.indexOf(3) > -1){
                            Utils.emitEvent(true, 1827)
                        }else {
                            Utils.emitEvent(false, 1827)
                        }
                        break;
                      }
                      case 'emitWebViewNativeMediaPlayerReadyState_4': {
                        readyState = 4
                        this.controller.loadUrl($rawfile('nativeMediaPlayerHandlerPreloadAuto.html'))
                        await Utils.sleep(8000)
                        this.controller.runJavaScript('buttonPlay()', (error, result) => {
                            console.error(`The buttonPlay() return error is: ${error}`);
                            console.log(`The buttonPlay() return value is: ${result}`);
                        })
                        await Utils.sleep(2000)
                        await this.retryPlayingGen(this.emitKey)()
                        await Utils.sleep(1000)
                        console.log(`The readyStateList.indexOf(4) is: ${readyStateList.indexOf(4)}`);
                        if (readyStateList.indexOf(4) > -1){
                            Utils.emitEvent(true, 1828)
                        }else {
                            Utils.emitEvent(false, 1828)
                        }
                        break;
                      }
                    }
                })
            }
            Stack() {
                Web({ src: '', controller: this.controller })
                    .enableNativeMediaPlayer({ enable: true, shouldOverlay: this.isShouldOverlay })
                    .onPageBegin(async (event: PageBeginParam) => {
                        console.error('enter onPageBegin, url:' + event.url);
                        if (this.controller.onCreateNativeMediaPlayer) {
                            let callback: webview.CreateNativeMediaPlayerCallback =
                                (handler: webview.NativeMediaPlayerHandler, mediaInfo: webview.MediaInfo) => {
                                    this.nativeMediaPlayerHandlerImpl = new NativeMediaPlayerHandlerImpl(handler)
                                    console.log('mediaInfo' + JSON.stringify(mediaInfo))
                                    this.isCallback = true
                                    if (mediaInfo.preload === webview.Preload.AUTO){
                                        Utils.emitEvent(true, 1812)
                                    }
                                    this.nativePlayer = new NativeMediaPlayerImpl(this,
                                        this.nativeMediaPlayerHandlerImpl, mediaInfo);
                                    console.info('onPageBegin key==>' + this.emitKey)
                                    switch (this.emitKey) {
                                      case 'emitWebViewNativeMediaPlayerUpdateRect_1':{
                                        this.nativePlayer.updateRect(-1, 1, 1200, 800);
                                        console.info('UpdateRect -1, 1, 1200, 800')
                                        Utils.emitEvent(true, 1821)
                                        break;
                                      }
                                      case 'emitWebViewNativeMediaPlayerUpdateRect_2':{
                                        this.nativePlayer.updateRect(4, -2, 1200, 800);
                                        console.info('UpdateRect 4, -2, 1200, 800')
                                        Utils.emitEvent(true, 1822)
                                        break;
                                      }
                                      case 'emitWebViewNativeMediaPlayerUpdateRect_3':{
                                        this.nativePlayer.updateRect(8, 9, -5.2, 800);
                                        console.info('UpdateRect 8, 9, -5.2, 800')
                                        Utils.emitEvent(true, 1823)
                                        break;
                                      }
                                      case 'emitWebViewNativeMediaPlayerUpdateRect_4':{
                                        this.nativePlayer.updateRect(88, 12, 1200, -6);
                                        console.info('UpdateRect 88, 12, 1200, -6')
                                        Utils.emitEvent(true, 1824)
                                        break;
                                      }


                                    }

                                    return this.nativePlayer;
                                }

                            this.controller.onCreateNativeMediaPlayer(callback);
                        }
                        switch (this.emitKey) {
                          case 'emitWebViewNativeMediaPlayerSetPlayRate10':{
                            await Utils.sleep(5000)
                            this.nativeMediaPlayerHandlerImpl.handlePlaybackRateChanged(10)
                          }
                          case 'emitWebViewNativeMediaPlayerSetPlayRate2_handleRateChange':
                          case 'emitWebViewNativeMediaPlayerSetPlayRate2':{
                            await Utils.sleep(5000)
                            this.nativeMediaPlayerHandlerImpl.handlePlaybackRateChanged(2)
                          }
                          case 'emitWebViewNativeMediaPlayerSetPlayRate1_point_2_handleRateChange':
                          case 'emitWebViewNativeMediaPlayerSetPlayRate1_point_2':{
                            await Utils.sleep(5000)
                            this.nativeMediaPlayerHandlerImpl.handlePlaybackRateChanged(1.2)
                          }
                          case 'emitWebViewNativeMediaPlayerSetPlayRate3_handleRateChange':
                          case 'emitWebViewNativeMediaPlayerSetPlayRate3':{
                            await Utils.sleep(5000)
                            this.nativeMediaPlayerHandlerImpl.handlePlaybackRateChanged(3)
                          }
                        }
                        this.controller.pauseAllMedia();
                        console.error('exit onPageBegin');
                    })
                    .onPageEnd(async () => {
                    })
                    .width('100%')
                    .height('100%')
                    .onAreaChange((oldValue: Area, newValue: Area) => {
                        oldValue;
                        this.area = newValue;
                    })

                if (this.showNativeMediaPlayer) {
                    NodeContainer(this.nodeController)
                        .width(this.nodeWidth + 'px')
                        .height(this.nodeHeight + 'px')
                        .backgroundColor(Color.Transparent)
                        .border({ width: 2, color: Color.Orange })
                }
            }
        }
    }
}
                    
   
