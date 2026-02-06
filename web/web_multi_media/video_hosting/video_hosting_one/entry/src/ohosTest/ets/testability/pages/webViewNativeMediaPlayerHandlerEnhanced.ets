/**
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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
import fs from '@ohos.file.fs';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import events_emitter from '@ohos.events.emitter';
import webview from '@ohos.web.webview';
import { BuilderNode, FrameNode, NodeController, NodeRenderType } from '@ohos.arkui.node';
import { UIContext } from '@ohos.arkui.UIContext';
import Utils from '../../test/Utils';
import JSON from '@ohos.util.json';
import connection from '@ohos.net.connection';
import intl from '@ohos.intl';

let isCreateNativeMediaPlayerCallback: Boolean = false
let isMediaPlaybackStatePlaying: Boolean = false
let isMediaTypeVideo: Boolean = false
let isMediaTypeAudio: Boolean = false
let isSourceTypeUrl: Boolean = false
let isSourceTypeMse: Boolean = false
let isPreloadMeta: Boolean = false
let isPlaying: Boolean = false
let isExitFullScreen: Boolean = false
let isEnterFullScreen: Boolean = false
let isError: Boolean = false
let isRelease: Boolean = false
let handleVolumeList: number[] = []
let volumeList: number[] = []

const EVENT_ID_SET_EMIT_KEY = 362000;
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
    private surfaceID: string = ''; // surfaceID用于播放画面展示，具体的值需要通过Xcomponent接口获取，相关文档链接见上面Xcomponent创建方法
    private isSeek: boolean = true; // 用于区分模式是否支持seek操作
    private fileSize: number = -1;
    private fd: number = 0;
    private listener?: AVPlayerListener
    avPlayer?: media.AVPlayer;
        
    setSurfaceID(surface_id: string) {
        console.log('setSurfaceID : ' + surface_id)
        this.surfaceID = surface_id;
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
                    Utils.emitEvent(true, 362110)
                    console.info('AVPlayer state prepared called.');
                    break;
                case 'playing': // play成功调用后触发该状态机上报
                    isPlaying = true
                    Utils.emitEvent(true, 362110)
                    console.info('AVPlayer state playing called.');
                    listener?.onPlaying();
                    break;
                case 'paused': // pause成功调用后触发该状态机上报
                    console.info('AVPlayer state paused called.');
                    Utils.emitEvent(true, 362100)
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
        this.isSeek = false; // 不支持seek操作
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
        this.isSeek = false; // 不支持seek操作
        // 为fdSrc赋值出发initialized状态机上报
        this.avPlayer.fdSrc = avFileDescriptor;
    }
    
    play() {
        console.info('AVPlayer.play()');
        this.avPlayer?.play()
    }
    pause() {
        console.info('AVPlayer.pause()');
        Utils.emitEvent(true, 362100)
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

        if (volume === 0) {
            Utils.emitEvent(true, 1564)
            Utils.emitEvent(true, 362300)
            handleVolumeList.push(0)
        }
        if (Math.abs(volume - 0.1) <= 0.1 ) {
            Utils.emitEvent(true, 1566)
            Utils.emitEvent(true, 362320)
            handleVolumeList.push(0.1)
        }
        if (Math.abs(volume - 0.5) <= 0.1 ) {
            Utils.emitEvent(true, 362310)
            Utils.emitEvent(true, 362340)
            handleVolumeList.push(0.5)
        }
        if (Math.abs(volume - 1) <= 0.1 ) {
            Utils.emitEvent(true, 362330)
            Utils.emitEvent(true, 362350)
            handleVolumeList.push(1)
        }
        this.rawHandler.handleVolumeChanged(volume)
    }
    
    handleMutedChanged(muted: boolean): void {
        console.log('handle muted:' + muted)
        if (muted) {
            Utils.emitEvent(true, 362592)
        } else {
            Utils.emitEvent(true, 362594)
        }
        this.rawHandler.handleMutedChanged(muted)
    }
    
    handlePlaybackRateChanged(playbackRate: number): void {
        console.log('handle playbackRate:' + playbackRate)
        this.rawHandler.handlePlaybackRateChanged(playbackRate)
    }
    
    handleDurationChanged(duration: number): void {
        console.log('handle duration :' + duration)
        this.rawHandler.handleDurationChanged(duration)
    }
    
    handleTimeUpdate(currentPlayTime: number): void {
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
        if (state === webview.NetworkState.IDLE) {
            Utils.emitEvent(true, 362060)
        }
        this.rawHandler.handleNetworkStateChanged(state)
    }
    
    handleReadyStateChanged(state: webview.ReadyState): void {
        console.log('handleReadyStateChanged :' + state)
        this.rawHandler.handleReadyStateChanged(state)
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
        console.log('handleError:' + 'mediaError' + errorMessage + ':' + errorMessage)
        this.rawHandler.handleError(error,errorMessage)
    }
    
    handleVideoSizeChanged(width: number, height: number): void {
        console.log('handleVideoSizeChanged:')
        this.rawHandler.handleVideoSizeChanged(width,height)
    }
}
class NativeMediaPlayerImpl implements webview.NativeMediaPlayerBridge{
    private surfaceId: string;
    mediaSource: string;
    private mediaHandler: webview.NativeMediaPlayerHandler;
    web: WebComponent;
    nativePlayer?: AVPlayerDemo;
    
    constructor(web: WebComponent, handler: webview.NativeMediaPlayerHandler, videoInfo: webview.MediaInfo) {
        this.web = web;
        this.mediaHandler = handler;
        this.surfaceId = videoInfo.surfaceInfo.id;
        if (videoInfo.mediaSrcList) {
            this.mediaSource = videoInfo.mediaSrcList[0].source;
        } else {
            this.mediaSource = ''
        }
        
        this.web.node_controller = new MyNodeController(
            this.web, this.surfaceId, this.mediaHandler, this, NodeRenderType.RENDER_TYPE_TEXTURE)
        this.web.node_controller.rebuild()
        this.web.show_native_media_player = true;
        
        console.log('NativeMediaPlayerImpl.mediaSource : ' + this.mediaSource);
    }
    
    setNativePlayer(nativePlayer: AVPlayerDemo) {
        this.nativePlayer = nativePlayer;
    }
    
    updateRect(x: number, y: number, width: number, height: number): void {
        this.web.node_width = width;
        this.web.node_height = height;
    }
    play() {
        console.log('[BrowserShell] ===gpz=== MediaPlayer.play');
        this.nativePlayer?.play();
        Utils.emitEvent(true, 362110)
    }
    pause() {
        console.log('[BrowserShell] ===gpz=== MediaPlayer.pause');
        this.nativePlayer?.pause();
    }
    seek(targetTime: number) {
        console.log('[BrowserShell] ===gpz=== MediaPlayer.seek(' + targetTime + ')');
        this.nativePlayer?.seek(targetTime);
    }
    setVolume(volume: number) {
        console.log('[BrowserShell] ===gpz=== MediaPlayer.setVolume(' + volume + ')');
        if (volume === 0) {
            this.setMuted(true)
            Utils.emitEvent(true, 1564)
        } else {
            this.setMuted(false)
        }
        if (Math.abs(volume - 0.1) <= 0.1 ) {
            volumeList.push(0.1)
            Utils.emitEvent(true, 1566)
        }
        if (Math.abs(volume - 0.5) <= 0.1 ) {
            volumeList.push(0.5)
            Utils.emitEvent(true, 362310)
        }
        if (Math.abs(volume - 1) <= 0.1 ) {
            volumeList.push(1)
            Utils.emitEvent(true, 362330)
        }
        if (volume < 1.1 ) {
            Utils.emitEvent(true, 362360)
        }
        this.nativePlayer?.setVolume(volume);
        this.web.nativeMediaPlayerHandlerImpl?.handleVolumeChanged(volume)

    }
    setMuted(muted: boolean) {
        console.log('[BrowserShell] ===gpz=== MediaPlayer.setMuted(' + muted + ')');
        
        if(muted) {
            Utils.emitEvent(true, 362591)
            this.nativePlayer?.setVolume(0)
        } else {
            Utils.emitEvent(true, 362593)
            this.nativePlayer?.setVolume(100)
        }
        this.web.nativeMediaPlayerHandlerImpl?.handleMutedChanged(muted)
    }
    setPlaybackRate(playbackRate: number) {
        console.log('[BrowserShell] ===gpz=== MediaPlayer.playbackRate(' + playbackRate + ')');
        this.nativePlayer?.setSpeed(playbackRate);
    }
    release() {
        console.log('[BrowserShell] ===gpz=== MediaPlayer.release');
        isRelease = true
        Utils.emitEvent(true, 362040)
        this.nativePlayer?.release();
        this.web.show_native_media_player = false;
    }
    enterFullscreen() {
        console.log('[BrowserShell] ===gpz=== MediaPlayer.enterFullscreen');
    }
    exitFullscreen() {
        console.log('[BrowserShell] ===gpz=== MediaPlayer.exitFullscreen');
    }
}

class AVPlayerListenerImpl implements AVPlayerListener {
    handler: webview.NativeMediaPlayerHandler;
    component: MyComponent;
    
    constructor(handler: webview.NativeMediaPlayerHandler, component: MyComponent) {
        this.handler = handler;
        this.component = component;
    }
    onPlaying() {
        console.log('[BrowserShell] onPlaying, handler[' + this.handler + ']')
        this.handler.handleStatusChanged(webview.PlaybackStatus.PLAYING);
        Utils.emitEvent(true, 362110)
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
        Utils.emitEvent(true, 362100)
        console.log('[BrowserShell] end onPaused');
    }
    onDurationChanged(duration: number) {
        console.log('[BrowserShell] onDurationChanged(' + duration + '), handler[' + this.handler + ']')
        this.handler.handleDurationChanged(duration);
        this.handler.handleNetworkStateChanged(webview.NetworkState.LOADING);
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
        this.handler.handleBufferedEndTimeChanged(buffered);
    }
    onTimeUpdate(time: number) {
        console.log('[BrowserShell] onTimeUpdate(' + time + '), handler[' + this.handler + ']')
        this.handler.handleTimeUpdate(time);
        this.handler.handleReadyStateChanged(webview.ReadyState.HAVE_METADATA);
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
        isError = true
        Utils.emitEvent(true, 362040)
        this.handler.handleError(1, 'Oops!');
    }
    onVideoSizeChanged(width: number, height: number) {
        console.log('[BrowserShell] onVideoSizeChanged(' + width + ',' + height + '), handler[' + this.handler + ']')
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
    @State player_changed: boolean = false;
    
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
    
    fullscreen: boolean = false;

    @Builder static ButtonBuilder(params: Params) {
        MyComponent({ params: params })
            .backgroundColor(Color.Green)
            .border({ width: 1, color: Color.Brown })
            .width('100%')
            .height('100%')
    }
    
    onSizeChanged(width: number, height: number) {
        this.videoWidth = width;
        this.videoHeight = height;
        let scale: number = this.viewWidth / width;
        let scaledVideoHeight: number = scale * height;
        this.videoHeightPercent = scaledVideoHeight / this.viewHeight * 100;
        console.log('[BrowserShell] onSizeChanged(' + width + ',' + height + '), videoHeightPercent[' + this.videoHeightPercent + ']')
    }
    
    build() {
        Column() {
            Stack() {
                XComponent({ id: 'video_player_id', type: XComponentType.SURFACE, controller: this.mXComponentController })
                  .width(this.videoWidthPercent + '%')
                  .height(this.videoHeightPercent + '%')
                  .border({ width: 1, color: Color.Red })
                  .onLoad(() => {
                      if (!this.params) {
                          console.log('this.params is null');
                          return;
                      }
                      console.log('[BrowserShell] MyComponent.onLoad, params[' + this.params
                        + '], text[' + this.params.text + '], text2[' + this.params.text2
                        + '], webTab[' + this.params.webTab + '], handler[' + this.params.handler + ']');
                      this.player = new AVPlayerDemo();
                      this.params.player?.setNativePlayer(this.player);
                      this.player.setSurfaceID(this.mXComponentController.getXComponentSurfaceId());
                      this.player_changed = !this.player_changed;
                      
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
            this.viewWidth = parseFloat(newValue.width.toString());
            this.viewHeight = parseFloat(newValue.height.toString());
            this.onSizeChanged(this.videoWidth, this.videoHeight);
        })
    }
}

class MyNodeController extends NodeController {
    private rootNode: BuilderNode<[Params]> | undefined;
    private isRemove = false;
    private sFaceId_: string;
    private renderType_: NodeRenderType
    webTab: WebComponent
    listener: webview.NativeMediaPlayerHandler
    player: NativeMediaPlayerImpl
        
    constructor(webTab: WebComponent, surfaceId: string, listener: webview.NativeMediaPlayerHandler, player: NativeMediaPlayerImpl, renderType: NodeRenderType) {
        super()
        this.webTab = webTab;
        this.listener = listener;
        this.player = player;
        this.sFaceId_ = surfaceId
        this.renderType_ = renderType
    }
    
    makeNode(UIContext: UIContext): FrameNode | null {
        this.rootNode = new BuilderNode(UIContext as UIContext, { surfaceId: this.sFaceId_, type: this.renderType_ });
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
  pageUrl: Resource = $rawfile('nativeMediaPlayerHandler.html')
  node_controller?: MyNodeController
  nativeMediaPlayerHandlerImpl?: NativeMediaPlayerHandlerImpl
  mediaInfo?: webview.MediaInfo
  // 日志列表
  @State messageList: Array<string> =[]
  @State show_native_media_player: boolean = false;
  @State node_width : number = 300;
  @State node_height : number = 150;
  @State isShouldOverlay : boolean = true;
  @State isCallback : boolean = true;
  @State isPageEnd:number = -1;
  @State isReceive: number = -1;
  //@State node_offset : Position = {x: 0, y: 0};
  
  area?: Area
  @State emitKey: string = '';
  
  onPageShow() {
      let valueChangeEvent: events_emitter.InnerEvent = {
          eventId: EVENT_ID_SET_EMIT_KEY,
          priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

    onPageHide() {
        events_emitter.off(EVENT_ID_SET_EMIT_KEY)
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
            while(retryTime < 6  && !isPlaying) {
                if (emitKey != this.emitKey) {
                    console.log( 'not samekey:' + emitKey + ' new emitKey:' + this.emitKey )
                    return
                }
                if(!isPlaying) {
                    console.log('retry playing' + this.emitKey)
                    if(retryTime < 3) {
                        if (emitKey != this.emitKey) {
                            console.log( 'not samekey:' + emitKey + ' new emitKey:' + this.emitKey )
                            return
                        }
                        console.log('buttonLoadTime:' + retryTime)
                        if (emitKey === this.emitKey) {
                            await this.controller.runJavaScript('buttonLoad()')
                        }
                    } else {
                        if (emitKey != this.emitKey) {
                            console.log( 'not samekey:' + emitKey + ' new emitKey:' + this.emitKey )
                            return
                        }
                        console.log('retry refresh:' + this.emitKey)
                        console.log('freshRetryTime:' + retryTime)
                        this.controller.refresh()
                    }
                    await Utils.sleep(2000)
                    await this.controller.runJavaScript('buttonPlay()')
                    await this.controller.runJavaScript('setCurrentTime()')

                    await Utils.sleep(3000)
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
              Button('web click').key('webViewNativeMediaPlayerHandlerEnhanced').onClick(async () => {
                  console.info('key==>' + this.emitKey)
                  isPlaying = false
                  this.isShouldOverlay = true
                  this.isCallback = false
                  await Utils.waitForExist(()=>this.isReceive, 'webMediaPlayerHandlerIsPageEnd', 1, 1000);
                  await Utils.waitForExist(()=>this.isPageEnd, 'webMediaPlayerHandlerIsPageEnd', 1, 1000);
                  this.isReceive = -1
                  if( Utils.isPC( this.controller ) ) {
                      Utils.emitEvent(true, 362010)
                      Utils.emitEvent(true, 362020)
                      Utils.emitEvent(true, 362030)
                      Utils.emitEvent(true, 362040)
                      Utils.emitEvent(true, 362050)
                      Utils.emitEvent(true, 362060)
                      Utils.emitEvent(true, 362070)
                      Utils.emitEvent(true, 362090)
                      Utils.emitEvent(true, 362080)
                      Utils.emitEvent(true, 362090)
                      Utils.emitEvent(true, 1564)
                      Utils.emitEvent(true, 362300)
                      Utils.emitEvent(true, 1566)
                      Utils.emitEvent(true, 362320)
                      Utils.emitEvent(true, 362310)
                      Utils.emitEvent(true, 362340)
                      Utils.emitEvent(true, 362330)
                      Utils.emitEvent(true, 362350)
                      Utils.emitEvent(true, 362360)
                      Utils.emitEvent(true, 362120)
                      Utils.emitEvent(true, 362130)
                      Utils.emitEvent(true, 362140)
                      Utils.emitEvent(true, 362150)
                      Utils.emitEvent(true, 362160)
                      Utils.emitEvent(true, 362170)
                      Utils.emitEvent(true, 362180)
                      Utils.emitEvent(true, 362190)
                      Utils.emitEvent(true, 362200)
                      Utils.emitEvent(true, 362210)
                      Utils.emitEvent(true, 362220)
                      Utils.emitEvent(true, 362230)
                      Utils.emitEvent(true, 362240)
                      Utils.emitEvent(true, 362250)
                      Utils.emitEvent(true, 362260)
                      Utils.emitEvent(true, 362270)
                      Utils.emitEvent(true, 362280)
                      Utils.emitEvent(true, 362290)
                      Utils.emitEvent(true, 362591)
                      Utils.emitEvent(true, 362592)
                      Utils.emitEvent(true, 362593)
                      Utils.emitEvent(true, 362594)
                      Utils.emitEvent(true, 362100)
                      Utils.emitEvent(true, 362110)
                  }
                  switch (this.emitKey) {
                      case 'emitWebViewNativeMediaPlayerShouldOverlayFalse': {
                          if ( Utils.isPC( this.controller ) ) {
                              Utils.emitEvent(true, 362050)
                              break;
                          }
                          this.isShouldOverlay = false
                          this.isPageEnd = -1;
                          this.controller.loadUrl($rawfile('multi_source_video.html'))
                          await Utils.waitForExist(()=>this.isPageEnd, 'webMediaPlayerHandlerIsPageEnd', 1, 1000);
                          this.controller.runJavaScript('buttonPlay()', (error, result) => {
                              console.error('The play() return error is: ${error}');
                              console.log('The play() return value is: ${result}');
                          })
                          if( this.isCallback ) {
                              Utils.emitEvent(true, 362050)
                          }
                          break;
                      }
                      case 'emitWebViewNativeMediaPlayerEnableTrueShouldOverlayTrue': {
                          if ( Utils.isPC( this.controller ) ) {
                              Utils.emitEvent(true, 362070)
                              break;
                          }
                          this.isPageEnd = -1;
                          this.controller.loadUrl($rawfile('multi_source_video.html'))
                          await Utils.waitForExist(()=>this.isPageEnd, 'webMediaPlayerHandlerIsPageEnd', 1, 1000);
                          this.controller.runJavaScript('buttonPlay()', (error, result) => {
                              console.error('The play() return error is: ${error}');
                              console.log('The play() return value is: ${result}');
                          })
                          if( this.isCallback ) {
                              Utils.emitEvent(true, 362070)
                          }
                          break;
                      }
                      case 'emitWebViewNativeMediaPlayerVideoMultiSource': {
                          if ( Utils.isPC( this.controller ) ) {
                              Utils.emitEvent(true, 362010)
                              break;
                          }
                          this.isPageEnd = -1;
                          this.controller.loadUrl($rawfile('multi_source_video.html'))
                          await Utils.waitForExist(()=>this.isPageEnd, 'webMediaPlayerHandlerIsPageEnd', 1, 1000);
                          this.isPageEnd = -1;
                          this.controller.refresh()
                          await Utils.waitForExist(()=>this.isPageEnd, 'webMediaPlayerHandlerIsPageEnd', 1, 1000);
                          this.controller.runJavaScript('buttonPlay()', (error, result) => {
                              console.error('The play() return error is: ${error}');
                              console.log('The play() return value is: ${result}');
                          })
                          if( this.isCallback ) {
                              Utils.emitEvent(true, 362010)
                          }
                          break;
                      }
                      case 'emitWebViewNativeMediaPlayerEnterFullScreen': {
                          if ( Utils.isPC( this.controller ) ) {
                              Utils.emitEvent(true, 362020)
                              break;
                          }
                          this.isPageEnd = -1;
                          this.controller.loadUrl($rawfile('fullScreenTest.html'))
                          await Utils.waitForExist(()=>this.isPageEnd, 'webMediaPlayerHandlerIsPageEnd', 1, 1000);
                          this.controller.runJavaScript('buttonPlay()', (error, result) => {
                              console.error('The play() return error is: ${error}');
                              console.log('The play() return value is: ${result}');
                          })
                          if( this.nativeMediaPlayerHandlerImpl ) {
                              if (this.nativeMediaPlayerHandlerImpl.handleFullscreenChanged) {
                                  this.nativeMediaPlayerHandlerImpl.handleFullscreenChanged(true);
                              } else {
                                  this.nativeMediaPlayerHandlerImpl.handleFullscreenChanged(true);
                              }
                          }
                          await Utils.sleep(2000)
                          this.controller.runJavaScript('checkIsFullScreen()', (error, result) => {
                              Utils.emitEvent(true, 362020)
                          })
                          break;
                      }
                      case 'emitWebViewNativeMediaPlayerExitFullScreen': {
                          this.isPageEnd = -1;
                          this.controller.loadUrl($rawfile('fullScreenTest.html'))
                          await Utils.waitForExist(()=>this.isPageEnd, 'webMediaPlayerHandlerIsPageEnd', 1, 1000);
                          this.controller.runJavaScript('buttonPlay()', (error, result) => {
                              console.error('The play() return error is: ${error}');
                              console.log('The play() return value is: ${result}');
                          })
                          if( this.nativeMediaPlayerHandlerImpl ) {
                              if (this.nativeMediaPlayerHandlerImpl.handleFullscreenChanged) {
                                  this.nativeMediaPlayerHandlerImpl.handleFullscreenChanged(true);
                              } else {
                                  this.nativeMediaPlayerHandlerImpl.handleFullscreenChanged(true);
                              }
                              await Utils.sleep(2000)
                              if (this.nativeMediaPlayerHandlerImpl.handleFullscreenChanged) {
                                  this.nativeMediaPlayerHandlerImpl.handleFullscreenChanged(false);
                              } else {
                                  this.nativeMediaPlayerHandlerImpl.handleFullscreenChanged(false);
                              }
                          }
                          await Utils.sleep(2000)
                          this.controller.runJavaScript('checkIsFullScreen()', (error, result) => {
                              Utils.emitEvent(true, 362030)
                          })
                          break;
                      }

                      case 'emitWebViewNativeMediaHandleErrorRelease': {
                          this.isPageEnd = -1;
                          this.controller.loadUrl($rawfile('nativeMediaError.html'))
                          await Utils.waitForExist(()=>this.isPageEnd, 'webMediaPlayerHandlerIsPageEnd', 1, 1000);
                          this.controller.runJavaScript('buttonPlay()', (error, result) => {
                              console.error('The play() return error is: ${error}');
                              console.log('The play() return value is: ${result}');
                          })
                          if ( isError && isRelease ) {
                              Utils.emitEvent(true, 362040)
                          }
                          break;
                      }

                      case 'emitWebViewNativeMediaHandleNetworkStateChangedIDLE': {
                          this.isPageEnd = -1;
                          this.controller.loadUrl(this.pageUrl)
                          await Utils.waitForExist(()=>this.isPageEnd, 'webMediaPlayerHandlerIsPageEnd', 1, 1000);
                          this.controller.runJavaScript('buttonPlay()', (error, result) => {
                              console.error('The play() return error is: ${error}');
                              console.log('The play() return value is: ${result}');
                          })
                          break;
                      }

                      case 'emitWebViewNativeMediaPlayerAudio': {
                          this.isPageEnd = -1;
                          this.controller.loadUrl($rawfile('media_audio.html'))
                          await Utils.waitForExist(()=>this.isPageEnd, 'webMediaPlayerHandlerIsPageEnd', 1, 1000);
                          if ( Utils.isPC( this.controller ) ) {
                              await Utils.sleep(1000)
                              Utils.emitEvent(true, 362080)
                              break;
                          }
                          this.isCallback = false
                          isPlaying = false
                          this.controller.runJavaScript('buttonPlay()', (error, result) => {
                              console.error('The play() return error is: ${error}');
                              console.log('The play() return value is: ${result}');
                          })
                          if( ! this.isCallback ) {
                              Utils.emitEvent(true, 362080)
                          }
                          if( !isPlaying) {
                              Utils.emitEvent(true, 362080)
                          }
                          break;
                      }

                      case 'emitWebViewNativeMediaPlayerMediaSrcUrl': {
                          this.isPageEnd = -1;
                          this.controller.loadUrl($rawfile('multi_source_video.html'))
                          await Utils.waitForExist(()=>this.isPageEnd, 'webMediaPlayerHandlerIsPageEnd', 1, 1000);
                          if ( Utils.isPC( this.controller ) ) {
                              await Utils.sleep(1000)
                              Utils.emitEvent(true, 362090)
                              break;
                          }
                          this.controller.runJavaScript('buttonPlay()', (error, result) => {
                              console.error('The play() return error is: ${error}');
                              console.log('The play() return value is: ${result}');
                          })
                          if( this.isCallback ) {
                              Utils.emitEvent(true, 362090)
                          }
                          break;
                      }
                      case 'emitWebViewNativeMediaPlayerSetVolume0':
                      case 'emitWebViewNativeMediaPlayerSetVolume0_handleVolumeChange': {
                          this.isPageEnd = -1;
                          this.controller.loadUrl($rawfile('nativeMediaPlayerHandlerSetVolume.html'))
                          await Utils.waitForExist(()=>this.isPageEnd, 'webMediaPlayerHandlerIsPageEnd', 1, 1000);
                          this.controller.runJavaScript('buttonPlay()', (error, result) => {
                              console.error('The play() return error is: ${error}');
                              console.log('The play() return value is: ${result}');
                          })
                          await Utils.sleep(1000)
                          await this.retryPlayingGen(this.emitKey)()
                          await Utils.sleep(1000)
                          this.controller.runJavaScript('setVolumeNumber(1)', (error, result) => {
                              console.log(`The setVolumeNumber() return value is: ${result}`);
                          })
                          await Utils.sleep(500)
                          this.controller.runJavaScript('setVolumeNumber(0.5)', (error, result) => {
                              console.log(`The setVolumeNumber() return value is: ${result}`);
                          })
                          await Utils.sleep(1000)
                          this.controller.runJavaScript('setVolumeNumber(0.1)', (error, result) => {
                              console.log(`The setVolumeNumber() return value is: ${result}`);
                          })
                          await Utils.sleep(1000)
                          this.controller.runJavaScript('setVolumeNumber(0)', (error, result) => {
                              console.log(`The setVolumeNumber() return value is: ${result}`);
                          })
                          await Utils.sleep(2000)
                          if(handleVolumeList.indexOf(0)>-1){
                              Utils.emitEvent(true, 362300)
                          }
                          break;
                      }
                      case 'emitWebViewNativeMediaPlayerSetVolume0_1':
                      case 'emitWebViewNativeMediaPlayerSetVolume0_1_handleVolumeChange': {
                          this.isPageEnd = -1;
                          this.controller.loadUrl($rawfile('nativeMediaPlayerHandlerSetVolume.html'))
                          await Utils.waitForExist(()=>this.isPageEnd, 'webMediaPlayerHandlerIsPageEnd', 1, 1000);
                          this.controller.runJavaScript('buttonPlay()', (error, result) => {
                              console.error('The play() return error is: ${error}');
                              console.log('The play() return value is: ${result}');
                          })
                          await Utils.sleep(1000)
                          await this.retryPlayingGen(this.emitKey)()
                          await Utils.sleep(1000)
                          this.controller.runJavaScript('setVolumeNumber(1)', (error, result) => {
                              console.log(`The setVolumeNumber() return value is: ${result}`);
                          })
                          await Utils.sleep(500)
                          this.controller.runJavaScript('setVolumeNumber(0.5)', (error, result) => {
                              console.log(`The setVolumeNumber() return value is: ${result}`);
                          })
                          await Utils.sleep(1000)
                          this.controller.runJavaScript('setVolumeNumber(0.1)', (error, result) => {
                              console.log(`The setVolumeNumber() return value is: ${result}`);
                          })
                          await Utils.sleep(1000)
                          if(volumeList.indexOf(0.1)>-1){
                              Utils.emitEvent(true, 1566)
                          }
                          if(handleVolumeList.indexOf(0.1)>-1){
                              Utils.emitEvent(true, 362320)
                          }
                          break;
                      }
                      case 'emitWebViewNativeMediaPlayerSetVolume0_5':
                      case 'emitWebViewNativeMediaPlayerSetVolume0_5_handleVolumeChange': {
                          this.isPageEnd = -1;
                          this.controller.loadUrl($rawfile('nativeMediaPlayerHandlerSetVolume.html'))
                          await Utils.waitForExist(()=>this.isPageEnd, 'webMediaPlayerHandlerIsPageEnd', 1, 1000);
                          this.isPageEnd = -1;
                          this.controller.refresh();
                          this.controller.runJavaScript('buttonPlay()', (error, result) => {
                              console.error('The play() return error is: ${error}');
                              console.log('The play() return value is: ${result}');
                          })
                          await Utils.sleep(1000)
                          await this.retryPlayingGen(this.emitKey)()
                          await Utils.sleep(1000)
                          this.isPageEnd = -1;
                          this.controller.runJavaScript('setVolumeNumber(1)', (error, result) => {
                              console.log(`The setVolumeNumber() return value is: ${result}`);
                              volumeList.push(1);
                              this.isPageEnd = 3;
                          })
                          await Utils.waitForExist(()=>this.isPageEnd, 'webMediaPlayerHandlerIsPageEnd', 3, 1000);
                          this.isPageEnd = -1;
                          this.controller.runJavaScript('setVolumeNumber(0.5)', (error, result) => {
                              console.log(`The setVolumeNumber() return value is: ${result}`);
                              handleVolumeList.push(0.5);
                              this.isPageEnd = 3;
                          })
                          await Utils.waitForExist(()=>this.isPageEnd, 'webMediaPlayerHandlerIsPageEnd', 3, 1000);
                          if(volumeList.indexOf(0.5)>-1){
                              Utils.emitEvent(true, 362310)
                          }
                          if(handleVolumeList.indexOf(0.5)>-1){
                              Utils.emitEvent(true, 362340)
                          }
                          break;
                      }
                      case 'emitWebViewNativeMediaPlayerSetVolume1':
                      case 'emitWebViewNativeMediaPlayerSetVolume1_handleVolumeChange': {
                          this.isPageEnd = -1;
                          this.controller.loadUrl($rawfile('nativeMediaPlayerHandlerSetVolume.html'))
                          await Utils.waitForExist(()=>this.isPageEnd, 'webMediaPlayerHandlerIsPageEnd', 1, 1000);
                          this.controller.runJavaScript('buttonPlay()', (error, result) => {
                              console.error('The play() return error is: ${error}');
                              console.log('The play() return value is: ${result}');
                          })
                          await Utils.sleep(2000)
                          await this.retryPlayingGen(this.emitKey)()
                          await Utils.sleep(1000)
                          this.controller.runJavaScript('setVolumeNumber(1)', (error, result) => {
                              console.log(`The setVolumeNumber() return value is: ${result}`);
                              volumeList.push(1);
                              handleVolumeList.push(1);
                          })
                          await Utils.sleep(2000)
                          if(volumeList.indexOf(1)>-1){
                              Utils.emitEvent(true, 362330)
                          }
                          if(handleVolumeList.indexOf(1)>-1){
                              Utils.emitEvent(true, 362350)
                          }
                          break;
                      }

                      case 'emitWebViewNativeMediaPlayerSetVolume1_1': {
                          this.isPageEnd = -1;
                          this.controller.loadUrl($rawfile('nativeMediaPlayerHandlerSetVolume.html'))
                          await Utils.waitForExist(()=>this.isPageEnd, 'webMediaPlayerHandlerIsPageEnd', 1, 1000);
                          this.controller.runJavaScript('setVolumeNumber(1_1)', (error, result) => {
                              if (error) {
                                  Utils.emitEvent(true, 362360)
                              }
                              console.log(`The setVolumeNumber() return value is: ${result}`);
                          })
                          break;
                      }
                      case 'emitWebViewNativeMediaPlayerPostUrl':
                      case 'emitWebViewNativeMediaPlayerMediaListSource':
                      case 'emitWebViewNativeMediaPlayerControlShownTrue':
                      case 'emitWebViewNativeMediaPlayerSurfaceInfoId':
                      case 'emitWebViewNativeMediaPlayerSurfaceInfoRect':
                      case 'emitWebViewNativeMediaPlayerMediaListFormat': {
                          this.isPageEnd = -1;
                          this.controller.loadUrl($rawfile('nativeMediaPlayerHandlerPostUrl.html'))
                          await Utils.waitForExist(()=>this.isPageEnd, 'webMediaPlayerHandlerIsPageEnd', 1, 1000);
                          this.controller.runJavaScript('buttonPlay()', (error, result) => {
                              console.error('The play() return error is: ${error}');
                              console.log('The play() return value is: ${result}');
                          })
                          break;
                      }

                      case 'emitWebViewNativeMediaPlayerControlShownFalse': {
                          this.isPageEnd = -1;
                          this.controller.loadUrl($rawfile('nativeMediaPlayerHandlerControlShownFalse.html'))
                          await Utils.waitForExist(()=>this.isPageEnd, 'webMediaPlayerHandlerIsPageEnd', 1, 1000);
                          this.controller.runJavaScript('buttonPlay()', (error, result) => {
                              console.error('The play() return error is: ${error}');
                              console.log('The play() return value is: ${result}');
                          })
                          break;
                      }
                      case 'emitWebViewNativeMediaPlayerControlListNodownload': {
                          this.isPageEnd = -1;
                          this.controller.loadUrl($rawfile('nativeMediaPlayerHandlerControlsNodownload.html'))
                          await Utils.waitForExist(()=>this.isPageEnd, 'webMediaPlayerHandlerIsPageEnd', 1, 1000);
                          this.controller.runJavaScript('buttonPlay()', (error, result) => {
                              console.error('The play() return error is: ${error}');
                              console.log('The play() return value is: ${result}');
                          })
                          break;
                      }
                      case 'emitWebViewNativeMediaPlayerControlListNofullscreen': {
                          this.isPageEnd = -1;
                          this.controller.loadUrl($rawfile('nativeMediaPlayerHandlerControlsNofullscreen.html'))
                          await Utils.waitForExist(()=>this.isPageEnd, 'webMediaPlayerHandlerIsPageEnd', 1, 1000);
                          this.controller.runJavaScript('buttonPlay()', (error, result) => {
                              console.error('The play() return error is: ${error}');
                              console.log('The play() return value is: ${result}');
                          })
                          break;
                      }
                      case 'emitWebViewNativeMediaPlayerNoremoteplayback': {
                          this.isPageEnd = -1;
                          this.controller.loadUrl($rawfile('nativeMediaPlayerHandlerControlsNoremoteplayback.html'))
                          await Utils.waitForExist(()=>this.isPageEnd, 'webMediaPlayerHandlerIsPageEnd', 1, 1000);
                          this.controller.runJavaScript('buttonPlay()', (error, result) => {
                              console.error('The play() return error is: ${error}');
                              console.log('The play() return value is: ${result}');
                          })
                          break;
                      }
                      case 'emitWebViewNativeMediaPlayerNodownloadNoremoteplaybackNoremoteplayback': {
                          this.isPageEnd = -1;
                          this.controller.loadUrl($rawfile('nativeMediaPlayerHandlerControlsAll.html'))
                          await Utils.waitForExist(()=>this.isPageEnd, 'webMediaPlayerHandlerIsPageEnd', 1, 1000);
                          this.controller.runJavaScript('buttonPlay()', (error, result) => {
                              console.error('The play() return error is: ${error}');
                              console.log('The play() return value is: ${result}');
                          })
                          break;
                      }
                      case 'emitWebViewNativeMediaPlayerMutedTrue': {
                          this.isPageEnd = -1;
                          this.controller.loadUrl($rawfile('nativeMediaPlayerHandlerMutedTrue.html'))
                          await Utils.waitForExist(()=>this.isPageEnd, 'webMediaPlayerHandlerIsPageEnd', 1, 1000);
                          this.controller.runJavaScript('buttonPlay()', (error, result) => {
                              console.error('The play() return error is: ${error}');
                              console.log('The play() return value is: ${result}');
                          })
                          break;
                      }
                      case 'emitWebViewNativeMediaPlayerMutedFalse': {
                          this.isPageEnd = -1;
                          this.controller.loadUrl($rawfile('nativeMediaPlayerHandlerMutedFalse.html'))
                          await Utils.waitForExist(()=>this.isPageEnd, 'webMediaPlayerHandlerIsPageEnd', 1, 1000);
                          this.controller.runJavaScript('buttonPlay()', (error, result) => {
                              console.error('The play() return error is: ${error}');
                              console.log('The play() return value is: ${result}');
                          })
                          break;
                      }
                      case 'emitWebViewNativeMediaPlayerHeaders':
                      case 'emitWebViewNativeMediaPlayerAttributes': {
                          this.isPageEnd = -1;
                          this.controller.loadUrl($rawfile('nativeMediaPlayerHandler.html'))
                          await Utils.waitForExist(()=>this.isPageEnd, 'webMediaPlayerHandlerIsPageEnd', 1, 1000);
                          this.controller.runJavaScript('buttonPlay()', (error, result) => {
                              console.error('The play() return error is: ${error}');
                              console.log('The play() return value is: ${result}');
                          })
                          break;
                      }
                      case 'emitWebViewNativeMediaPlayerPreloadNone': {
                          this.isPageEnd = -1;
                          this.controller.loadUrl($rawfile('nativeMediaPlayerHandlerPreloadNone.html'))
                          await Utils.waitForExist(()=>this.isPageEnd, 'webMediaPlayerHandlerIsPageEnd', 1, 1000);
                          this.controller.runJavaScript('buttonPlay()', (error, result) => {
                              console.error('The play() return error is: ${error}');
                              console.log('The play() return value is: ${result}');
                          })
                          break;
                      }
                      case 'emitWebViewNativeMediaPlayerPreloadMetadata': {
                          this.isPageEnd = -1;
                          this.controller.loadUrl($rawfile('nativeMediaPlayerHandlerPreloadMetadata.html'))
                          await Utils.waitForExist(()=>this.isPageEnd, 'webMediaPlayerHandlerIsPageEnd', 1, 1000);
                          this.controller.runJavaScript('buttonPlay()', (error, result) => {
                              console.error('The play() return error is: ${error}');
                              console.log('The play() return value is: ${result}');
                          })
                          break;
                      }
                      case 'emitWebViewNativeMediaPlayerPreloadAuto': {
                          this.isPageEnd = -1;
                          this.controller.loadUrl($rawfile('nativeMediaPlayerHandlerPreloadAuto.html'))
                          await Utils.waitForExist(()=>this.isPageEnd, 'webMediaPlayerHandlerIsPageEnd', 1, 1000);
                          this.controller.runJavaScript('buttonPlay()', (error, result) => {
                              console.error('The play() return error is: ${error}');
                              console.log('The play() return value is: ${result}');
                          })
                          break;
                      }
                      case 'emitWebViewNativeMediaPlayerSetMutedTrue':
                      case 'emitWebViewNativeMediaPlayerSetMutedTrue_handleMutedChange': {
                          this.isPageEnd = -1;
                          this.controller.loadUrl($rawfile('nativeMediaPlayerHandlerSetVolume.html'))
                          await Utils.waitForExist(()=>this.isPageEnd, 'webMediaPlayerHandlerIsPageEnd', 1, 1000);
                          this.controller.runJavaScript('buttonPlay()', (error, result) => {
                              console.error('The play() return error is: ${error}');
                              console.log('The play() return value is: ${result}');
                          })
                          await Utils.sleep(1000)
                          await this.retryPlayingGen(this.emitKey)()
                          await Utils.sleep(1000)
                          this.controller.runJavaScript('setVolumeNumber(0.5)', (error, result) => {
                              console.log(`The setVolumeNumber() return value is: ${result}`);
                          })
                          this.controller.runJavaScript('setVolumeNumber(0)', (error, result) => {
                              console.log(`The setVolumeNumber() return value is: ${result}`);
                          })
                          this.nativePlayer?.setMuted(true)
                          this.nativeMediaPlayerHandlerImpl?.handleMutedChanged(true)
                          break;
                      }
                      case 'emitWebViewNativeMediaPlayerSetMutedFalse':
                      case 'emitWebViewNativeMediaPlayerSetMutedFalse_handleMutedChange': {
                          this.isPageEnd = -1;
                          this.controller.loadUrl($rawfile('nativeMediaPlayerHandlerSetVolume.html'))
                          await Utils.waitForExist(()=>this.isPageEnd, 'webMediaPlayerHandlerIsPageEnd', 1, 1000);
                          this.controller.runJavaScript('buttonPlay()', (error, result) => {
                              console.error('The play() return error is: ${error}');
                              console.log('The play() return value is: ${result}');
                          })
                          await Utils.sleep(1000)
                          await this.retryPlayingGen(this.emitKey)()
                          await Utils.sleep(1000)
                          this.controller.runJavaScript('setVolumeNumber(0)', (error, result) => {
                              console.log(`The setVolumeNumber() return value is: ${result}`);
                          })

                          this.controller.runJavaScript('setVolumeNumber(0.5)', (error, result) => {
                              console.log(`The setVolumeNumber() return value is: ${result}`);
                          })
                          this.nativePlayer?.setMuted(false)
                          this.nativeMediaPlayerHandlerImpl?.handleMutedChanged(false)
                          break;
                      }

                      case 'emitWebViewNativeMediaPlayerHandleStatusChangedPause': {
                          this.isPageEnd = -1;
                          this.controller.loadUrl($rawfile('nativeMediaPlayerHandler.html'))
                          await Utils.waitForExist(()=>this.isPageEnd, 'webMediaPlayerHandlerIsPageEnd', 1, 1000);
                          this.controller.runJavaScript('buttonPause()', (error, result) => {
                              console.error('The play() return error is: ${error}');
                              console.log('The play() return value is: ${result}');
                          })
                          this.nativePlayer?.pause()
                          break;
                      }
                      case 'emitWebViewNativeMediaPlayerHandleStatusChangedPlaying': {
                          this.isPageEnd = -1;
                          this.controller.loadUrl($rawfile('nativeMediaPlayerHandler.html'))
                          await Utils.waitForExist(()=>this.isPageEnd, 'webMediaPlayerHandlerIsPageEnd', 1, 1000);
                          this.controller.runJavaScript('buttonPlay()', (error, result) => {
                              console.error('The play() return error is: ${error}');
                              console.log('The play() return value is: ${result}');
                          })
                          this.nativePlayer?.play()
                          break;
                      }
                  }
              })
          }
          Stack() {
              Web({ src: $rawfile('nativeMediaPlayerHandlerSetVolume.html'), controller: this.controller })
                  .enableNativeMediaPlayer({ enable: true, shouldOverlay: this.isShouldOverlay })
                  .onPageBegin((event: PageBeginParam) => {

                      console.error('enter onPageBegin, url:' + event.url);
                      console.error(' in onPageBegin, onCreateNativeMediaPlayer:' + this.controller.onCreateNativeMediaPlayer);
                      if (this.controller.onCreateNativeMediaPlayer) {
                          let callback: webview.CreateNativeMediaPlayerCallback =
                          (handler: webview.NativeMediaPlayerHandler, mediaInfo: webview.MediaInfo) => {
                              this.nativeMediaPlayerHandlerImpl = new NativeMediaPlayerHandlerImpl(handler)
                              console.log('mediaInfo' + JSON.stringify(mediaInfo))
                              this.isCallback = true
                              Utils.emitEvent(true, 1539)
                              Utils.emitEvent(true, 362010)
                              if( mediaInfo ) {
                                  let isControls = ( mediaInfo.controlsShown === false && mediaInfo.controlList.length === 0)
                                  let isPreloadNone = ( mediaInfo.preload === webview.Preload.NONE )
                                  let isMediaSrcType =  mediaInfo.mediaSrcList.length > 0 && mediaInfo.mediaSrcList[0].type === webview.SourceType.URL
                                  let isSurface = !!mediaInfo.surfaceInfo && !!mediaInfo.surfaceInfo.id && !!mediaInfo.surfaceInfo.rect
                                  let isPosterUrl = ( mediaInfo.posterUrl.length > 0 )
                                  if(isMediaSrcType) {
                                      Utils.emitEvent(true, 362090)
                                  }
                                  if (isControls && isPreloadNone && isMediaSrcType && isSurface && isPosterUrl ) {
                                      Utils.emitEvent(true, 362010)
                                  }
                                  if(mediaInfo.posterUrl.length > 0 && mediaInfo.posterUrl.indexOf('runoob.com') > -1 ){
                                      Utils.emitEvent(true, 362120)
                                  }
                                  if(mediaInfo.mediaSrcList[0].source.length > 0 && mediaInfo.mediaSrcList[0].source.indexOf('movie.mp4') > -1 ){
                                      Utils.emitEvent(true, 362130)
                                  }
                                  if(mediaInfo.mediaSrcList[0].format.length > 0 && mediaInfo.mediaSrcList[0].format.indexOf('mp4') > -1 ){
                                      Utils.emitEvent(true, 362140)
                                  }
                                  if(!! mediaInfo.surfaceInfo && mediaInfo.surfaceInfo.id.length >0 ) {
                                      Utils.emitEvent(true, 362150)
                                  }
                                  if (!! mediaInfo.surfaceInfo && !! mediaInfo.surfaceInfo.rect ) {
                                      Utils.emitEvent(true, 362160)
                                  }
                                  if ( mediaInfo.controlsShown.toString() == 'true') {
                                      Utils.emitEvent(true, 362170)
                                  }
                                  if ( mediaInfo.controlsShown.toString() == 'false') {
                                      Utils.emitEvent(true, 362180)
                                  }
                                  if ( mediaInfo.controlList.indexOf('nodownload') > -1) {
                                      Utils.emitEvent(true, 362190)
                                  }
                                  if ( mediaInfo.controlList.indexOf('nofullscreen') > -1) {
                                      Utils.emitEvent(true, 362200)
                                  }
                                  if ( mediaInfo.controlList.indexOf('noremoteplayback') > -1) {
                                      Utils.emitEvent(true, 362210)
                                  }
                                  if ( mediaInfo.controlList.indexOf('nodownload') > -1 &&  mediaInfo.controlList.indexOf('nofullscreen') > -1 &&  mediaInfo.controlList.indexOf('noremoteplayback') > -1) {
                                      Utils.emitEvent(true, 362220)
                                  }
                                  if ( mediaInfo.muted.toString() === 'true') {
                                      Utils.emitEvent(true, 362230)
                                  }
                                  if ( mediaInfo.muted.toString() === 'false') {
                                      Utils.emitEvent(true, 362240)
                                  }

                                  if (!! mediaInfo.headers && Object.keys(mediaInfo.headers).length >= 0) {
                                      Utils.emitEvent(true, 362250)
                                  }

                                  if (!! mediaInfo.attributes && Object.keys(mediaInfo.attributes).length >= 0) {
                                      Utils.emitEvent(true, 362260)
                                  }
                                  if ( mediaInfo.preload.toString() === '0') {
                                      Utils.emitEvent(true, 362270)
                                  }
                                  if ( mediaInfo.preload.toString() === '1') {
                                      Utils.emitEvent(true, 362280)
                                  }
                                  if ( mediaInfo.preload.toString() === '2') {
                                      Utils.emitEvent(true, 362290)
                                  }
                              }
                              this.nativeMediaPlayerHandlerImpl = new NativeMediaPlayerHandlerImpl(handler)
                              this.nativeMediaPlayerHandlerImpl.handleNetworkStateChanged(webview.NetworkState.IDLE);
                              Utils.emitEvent(true, 362060)
                              this.nativePlayer = new NativeMediaPlayerImpl(this, this.nativeMediaPlayerHandlerImpl, mediaInfo);
                              return this.nativePlayer;
                          }

                          this.controller.onCreateNativeMediaPlayer(callback);
                      }
                      switch (this.emitKey) {
                          case 'emitWebViewNativeMediaPlayerSetVolume0_5':
                              this.nativeMediaPlayerHandlerImpl?.handleVolumeChanged(0.5)
                              break;
                          case 'emitWebViewNativeMediaPlayerSetVolume1_1':
                              this.controller.runJavaScript('setVolumeNumber(1_1)', (error, result) => {
                                  if (error) {
                                      Utils.emitEvent(true, 362360)
                                  }
                                  console.log(`The setVolumeNumber() return value is: ${result}`);
                              })
                              break;
                          case 'emitWebViewNativeMediaPlayerSetMutedTrue':
                              this.nativePlayer?.setMuted(true)
                              break;
                          case 'emitWebViewNativeMediaPlayerSetMutedTrue_handleMutedChange':
                              this.nativeMediaPlayerHandlerImpl?.handleMutedChanged(true)
                              break;
                          case 'emitWebViewNativeMediaPlayerSetMutedFalse':
                              this.nativePlayer?.setMuted(false)
                              break;
                          case 'emitWebViewNativeMediaPlayerSetMutedFalse_handleMutedChange':
                              this.nativeMediaPlayerHandlerImpl?.handleMutedChanged(false)
                              break;

                          default:
                              break;
                      }
                      this.controller.pauseAllMedia();
                      console.error('exit onPageBegin');
                  })
                  .onPageEnd((event) => {
                      console.log('onPageEnd url:' + event.url);
                      console.info("this.isPageEnd = 1");
                      this.isPageEnd = 1;
                  })
                  .width('100%')
                  .height('100%')
                  .onAreaChange((oldValue: Area, newValue: Area) => {
                      oldValue;
                      this.area = newValue;
                  })

              if (this.show_native_media_player) {
                  NodeContainer(this.node_controller)
                      .width(this.node_width + 'px')
                      .height(this.node_height + 'px')
                      .backgroundColor(Color.Transparent)
                      .border({ width: 2, color: Color.Orange })
              }
          }
      }
  }
}
                    
   
