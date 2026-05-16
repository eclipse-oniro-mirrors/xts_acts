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
import Utils from '../../test/Utils.test';
import JSON from '@ohos.util.json';

let isPlaying: Boolean = false
let isError: Boolean = false
let isRelease: Boolean = false
let playbackRateSetWithUndefined: Boolean = false

const EVENT_ID_SET_EMIT_KEY = 361710;

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
    private sFaceId: string = '';
    private isSeek: boolean = true;
    private fd: number = 0;
    private listener?: AVPlayerListener
    public avPlayer?: media.AVPlayer;

    setSfID(sFaceId: string) {
        this.sFaceId = sFaceId;
    }
    setAVPlayerCallback(avPlayer: media.AVPlayer, listener: AVPlayerListener) {
        this.listener = listener
        avPlayer.on('seekDone', (seekDoneTime: number) => {
            console.info('AVPlayer seek succeeded, seek time is ${seekDoneTime}');
        })
        avPlayer.on('error', (err: BusinessError) => {
            console.error(`[BrowserShell] Invoke avPlayer failed, code is ${err.code}, message is ${err.message}`);
            listener?.onError(err.code,err.message);
            avPlayer.reset();
        })
        avPlayer.on('volumeChange', (vol:number) => {
            console.info('volumeChange success,and new volume is :' + vol)
            listener.onVolume && listener.onVolume(vol);
        })
        avPlayer.on('stateChange', async (state: string, reason: media.StateChangeReason) => {
            switch (state) {
              case 'idle':
                console.info('AVPlayer state idle called.');
                avPlayer.release();
                break;
              case 'initialized':
                console.info('AVPlayer state initialized called. ');
                avPlayer.surfaceId = this.sFaceId;
                avPlayer.prepare();
                break;
              case 'prepared':
                isPlaying = true
                console.info('AVPlayer state prepared called.');
                break;
              case 'playing':
                isPlaying = true
                console.info('AVPlayer state playing called.');
                listener?.onPlaying();
                break;
              case 'paused':
                console.info('AVPlayer state paused called.');
                listener?.onPaused();
                break;
              case 'completed':
                console.info('AVPlayer state completed called.');
                avPlayer.stop();
                break;
              case 'stopped':
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

    async avPlayerLiveDemo(url: string, listener: AVPlayerListener) {
        this.listener = listener
        this.avPlayer = await media.createAVPlayer();
        this.setAVPlayerCallback(this.avPlayer, listener);
        this.isSeek = true;
        this.avPlayer.url = url;
    }

    async avPlayerFdSrcDemo(listener: AVPlayerListener) {
        this.avPlayer = await media.createAVPlayer();
        this.setAVPlayerCallback(this.avPlayer, listener);
        let context = getContext(this) as common.UIAbilityContext;
        let fileDescriptor = await context.resourceManager.getRawFd('mate50-pro-tvc.mp4');
        let avFileDescriptor: media.AVFileDescriptor =
            { fd: fileDescriptor.fd, offset: fileDescriptor.offset, length: fileDescriptor.length };
        this.isSeek = true;
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
    setVolume(volume: number) {
        console.info('AVPlayer.setVolume(' + volume + ')');
        this.avPlayer?.setVolume(volume)
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
        console.log('handleError:' + 'mediaError' + error + ':' + errorMessage)
        this.rawHandler.handleError(error,errorMessage)
    }

    handleVideoSizeChanged(width: number, height: number): void {
        console.log('handleVideoSizeChanged:')
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
        console.info('updateRect -->' + 'x:' + x + ',y:' + y + ',width:' + width + ',height:' + height)
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
        this.nativePlayer?.seek(targetTime);
    }
    setVolume(volume: number) {
        console.log('[BrowserShell] ===gpz=== MediaPlayer.setVolume(' + volume + ')');
        this.web.nativeMediaPlayerHandlerImpl?.handleVolumeChanged(volume)
        this.nativePlayer?.setVolume(volume);
    }
    setMuted(muted: boolean) {
        console.log('[BrowserShell] ===gpz=== MediaPlayer.setMuted(' + muted + ')');
    }
    setPlaybackRate(playbackRate: number | null | undefined) {
        console.log('[BrowserShell] ===gpz=== MediaPlayer.playbackRate(' + playbackRate + ')');
        
        if (playbackRate === null) {
            console.log('[BrowserShell] setPlaybackRate called with playbackRate=null');
            // Use default playback rate value when null is passed
            this.web.nativeMediaPlayerHandlerImpl?.handlePlaybackRateChanged(1.0);
            this.nativePlayer?.setSpeed(1.0);
        } else if (playbackRate === undefined) {
            console.log('[BrowserShell] setPlaybackRate called with playbackRate=undefined');
            playbackRateSetWithUndefined = true;
            Utils.emitEvent(true, 20260308);
            // Use default playback rate value when undefined is passed
            this.web.nativeMediaPlayerHandlerImpl?.handlePlaybackRateChanged(1.0);
            this.nativePlayer?.setSpeed(1.0);
        } else {
            // Normal case with valid number
            this.web.nativeMediaPlayerHandlerImpl?.handlePlaybackRateChanged(playbackRate);
            this.nativePlayer?.setSpeed(playbackRate);
        }
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
    suspendPlayer(type: webview.SuspendType) {

    }
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
    onSeekFinished(seekDoneTime: number) {
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
        console.log('[BrowserShell] onTimeUpdate(' + time +  '), handler[' + this.handler + ']')
        this.handler.handleTimeUpdate(time);
        this.handler.handleReadyStateChanged(webview.ReadyState.HAVE_METADATA);
    }
    onEnded() {
        console.log('[BrowserShell] onEnded(), handler[' + this.handler + ']')
        this.handler.handleEnded();
    }
    onError() {
        console.log('[BrowserShell] onError(), handler[' + this.handler + ']')
        isError = true
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
                    }
                    .width('100%')
                    .justifyContent(FlexAlign.SpaceEvenly)
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
    @State isPageEnd:number = -1;
    @State isReceive: number = -1;

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
                this.isReceive = 1;
                console.info('valueChangeCallBack: this.emitKey' + this.emitKey);
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
            }
        }
    }

    build() {
        Column() {
            Row() {
                Button('NativeMediaPlayerSetPlaybackRate2').key('webViewNativeMediaPlayerSetPlaybackRate2Button').onClick(async () => {
                    console.info('key==>' + this.emitKey)
                    await Utils.waitForExist(()=>this.isReceive, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
                    this.isReceive = -1;
                    isPlaying = false
                    isError = false
                    playbackRateSetWithUndefined = false
                    this.isShouldOverlay = true
                    this.isCallback = false
                    this.isPageEnd = -1;
                    this.controller.loadUrl($rawfile('nativeMediaPlayerHandler.html'))
                    await Utils.waitForExist(()=>this.isPageEnd, 'webMediaPlayerHandlerIsPageEnd', 1, 1000);
                    if (Utils.isPC(this.controller) ) {
                        Utils.emitEvent(true, 361710)
                        return
                    }
                    switch (this.emitKey) {
                      case 'emitWebViewNativeMediaPlayerSetPlaybackRateWithUndefined': {
                        this.isPageEnd = -1;
                        this.controller.loadUrl($rawfile('nativeMediaPlayerHandler.html'));
                        await Utils.waitForExist(()=>this.isPageEnd, 'webMediaPlayerHandlerIsPageEnd', 1, 1000);
                        this.controller.runJavaScript('buttonPlay()', (error, result) => {
                            console.error(`The buttonPlay() return error is: ${error}`);
                            console.log(`The buttonPlay() return value is: ${result}`);
                        })
                        this.controller.runJavaScript('buttonLoad()', (error, result) => {
                            console.error(`The buttonLoad() return error is: ${error}`);
                            console.log(`The buttonLoad() return value is: ${result}`);
                        })
                        await this.retryPlayingGen(this.emitKey)()
                        await Utils.sleep(2000)
                        
                        if (this.nativePlayer && this.nativePlayer.setPlaybackRate) {
                            this.nativePlayer.setPlaybackRate(undefined);
                        }
                        
                        await Utils.sleep(1000)
                        console.log('playbackRateSetWithUndefined: ' + playbackRateSetWithUndefined);
                        break;
                      }
                    }
                })
            }
            Stack() {
                Web({ src: '', controller: this.controller })
                    .enableNativeMediaPlayer({ enable: true, shouldOverlay: this.isShouldOverlay })
                    .onPageBegin((event: PageBeginParam) => {
                        console.error('enter onPageBegin, url:' + event.url);
                        if (this.controller.onCreateNativeMediaPlayer) {
                            let callback: webview.CreateNativeMediaPlayerCallback =
                                (handler: webview.NativeMediaPlayerHandler, mediaInfo: webview.MediaInfo) => {
                                    this.nativeMediaPlayerHandlerImpl = new NativeMediaPlayerHandlerImpl(handler)
                                    this.isCallback = true
                                    this.nativePlayer = new NativeMediaPlayerImpl(this,
                                        this.nativeMediaPlayerHandlerImpl, mediaInfo);
                                    return this.nativePlayer;
                                }

                            this.controller.onCreateNativeMediaPlayer(callback);
                        }
                        this.controller.pauseAllMedia();
                        console.error('exit onPageBegin');
                    })
                    .onPageEnd((event) => {
                        console.log('onPageEnd url:' + event.url);
                        this.isPageEnd = 1;
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