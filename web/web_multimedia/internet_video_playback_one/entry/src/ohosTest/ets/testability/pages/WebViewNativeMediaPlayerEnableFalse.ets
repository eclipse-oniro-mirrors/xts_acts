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
import Utils from '../../test/Utils.test';
import JSON from '@ohos.util.json';
import connection from '@ohos.net.connection';
let isCreateNativeMediaPlayerCallback: Boolean = false
let isMediaPlaybackStatePlaying: Boolean = false
let isMediaTypeVideo: Boolean = false
let isMediaTypeAudio: Boolean = false
let isSourceTypeUrl: Boolean = false
let isSourceTypeMse: Boolean = false
let isPreloadMeta: Boolean = false
let isPlaying: Boolean = false

const EVENT_ID_SET_EMIT_KEY = 360000;

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
class NativeMediaPlayerHandlerImpl implements webview.NativeMediaPlayerHandler{
    
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
        console.log('NativeMediaPlayerImpl.constructor, surface_id[' + videoInfo.surfaceInfo.id + ']');
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
        this.nativePlayer?.setVolume(volume);
    }
    setMuted(muted: boolean) {
        console.log('[BrowserShell] ===gpz=== MediaPlayer.setMuted(' + muted + ')');
        
        if(muted) {
            this.nativePlayer?.setVolume(0)
        } else {
            this.nativePlayer?.setVolume(100)
        }
    }
    setPlaybackRate(playbackRate: number) {
        console.log('[BrowserShell] ===gpz=== MediaPlayer.playbackRate(' + playbackRate + ')');
        this.nativePlayer?.setSpeed(playbackRate);
    }
    release() {
        console.log('[BrowserShell] ===gpz=== MediaPlayer.release');
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
    web_tab: WebComponent
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
    offset_x: number = 0
    offset_y: number = 0
    @State video_width_percent: number = 100;
    @State video_height_percent: number = 100;
    view_width: number = 0;
    view_height: number = 0;
    video_width: number = 0;
    video_height: number = 0;
    
    fullscreen: boolean = false;

    @Builder static ButtonBuilder(params: Params) {
        MyComponent({ params: params })
            .backgroundColor(Color.Green)
            .border({ width: 1, color: Color.Brown })
            .width('100%')
            .height('100%')
    }
    
    onSizeChanged(width: number, height: number) {
        this.video_width = width;
        this.video_height = height;
        let scale: number = this.view_width / width;
        let scaled_video_height: number = scale * height;
        this.video_height_percent = scaled_video_height / this.view_height * 100;
        console.log('[BrowserShell] onSizeChanged(' + width + ',' + height + '), video_height_percent[' + this.video_height_percent + ']')
    }
    
    build() {
        Column() {
            Stack() {
                XComponent({ id: 'video_player_id', type: XComponentType.SURFACE, controller: this.mXComponentController })
                  .width(this.video_width_percent + '%')
                  .height(this.video_height_percent + '%')
                  .border({ width: 1, color: Color.Red })
                  .onLoad(() => {
                      if (!this.params) {
                          console.log('this.params is null');
                          return;
                      }
                      console.log('[BrowserShell] MyComponent.onLoad, params[' + this.params
                        + '], text[' + this.params.text + '], text2[' + this.params.text2
                        + '], web_tab[' + this.params.web_tab + '], handler[' + this.params.handler + ']');
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
            this.view_width = new Number(newValue.width).valueOf()
            this.view_height = new Number(newValue.height).valueOf()
            
            this.onSizeChanged(this.video_width, this.video_height);
        })
    }
}

class MyNodeController extends NodeController {
    private rootNode: BuilderNode<[Params]> | undefined;
    private isRemove = false;
    private surfaceId_: string;
    private renderType_: NodeRenderType
    web_tab: WebComponent
    listener: webview.NativeMediaPlayerHandler
    player: NativeMediaPlayerImpl
        
    constructor(web_tab: WebComponent, surfaceId: string, listener: webview.NativeMediaPlayerHandler, player: NativeMediaPlayerImpl, renderType: NodeRenderType) {
        super()
        this.web_tab = web_tab;
        this.listener = listener;
        this.player = player;
        this.surfaceId_ = surfaceId
        this.renderType_ = renderType
        console.log('[BrowserShell] MyNodeController, rootNode[' + this.rootNode + 
            '], web_tab[' + web_tab +
            '], listener[' + listener +
            '], surfaceId[' + surfaceId +
            ']')
    }
    
    makeNode(UIContext: UIContext): FrameNode | null {
        this.rootNode = new BuilderNode(UIContext as UIContext, { surfaceId: this.surfaceId_, type: this.renderType_ });
        this.build()
        if (this.rootNode) {
            return this.rootNode.getFrameNode() as FrameNode;
        }
        return null;
    }
    build() {
        if (this.rootNode) {
            this.rootNode.build(new WrappedBuilder(MyComponent.ButtonBuilder),
                                {'text': 'play', 'text2': 'pause', web_tab:this.web_tab, handler: this.listener, player: this.player})
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
  page_url: Resource = $rawfile('nativeMediaPlayerHandler.html')
  node_controller?: MyNodeController
  // 日志列表
  @State messageList: Array<string> =[]
  @State show_native_media_player: boolean = false;
  @State node_width : number = 300;
  @State node_height : number = 150;
  @State isNoCallback : boolean = true;
  @State shouldOverlay : boolean = true;
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
          while(retryTime < 5) {
              retryTime += 1
              if (emitKey != this.emitKey) {
                  return
              }
              if(!isPlaying) {
                  this.controller.refresh()
                  await Utils.sleep(3000)
                  this.controller.runJavaScript('buttonPlay()', (error, result) => {
                      console.error('The play() return error is: ${error}');
                      console.log('The play() return value is: ${result}');
                  })
              }
          }
      }
  }

  build() {
      Column() {
          Row() {
              Button('web click').key('webViewNativeMediaPlayerEnableFalse').onClick(async () => {
                console.info('key==>' + this.emitKey)
                isPlaying = false
                this.controller.refresh();
                await Utils.waitForExist(()=>this.isReceive, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
                await Utils.waitForExist(()=>this.isPageEnd, 'webViewSetHttpDnsIsPageEnd', 1, 1000);
                this.isReceive = -1;
                this.controller.runJavaScript('buttonPlay()', (error, result) => {
                    console.error('The play() return error is: ${error}');
                    console.log('The play() return value is: ${result}');
                })
                switch (this.emitKey) {
                    case 'emitWebViewNativeMediaPlayerEnableFalse': {
                        this.isNoCallback = true;
                        this.shouldOverlay = true;
                        this.isPageEnd = -1;
                        this.controller.refresh();
                        await Utils.waitForExist(()=>this.isPageEnd, 'webSetNetErrorCode2ButtonIsPageEnd', 1, 1000);
                        if( this.isNoCallback ) {
                            Utils.emitEvent(true, 360010)
                        }
                        break;
                    }
                    case 'emitWebViewNativeMediaPlayerEnableFalseShouldOverlayFalse': {
                        this.isNoCallback = true
                        this.shouldOverlay = false
                        this.isPageEnd = -1;
                        this.controller.refresh();
                        if( this.isNoCallback ) {
                            Utils.emitEvent(true, 360020)
                        }
                        break;
                    }
                }
              })
          }
          Stack() {
              Web({ src: this.page_url, controller: this.controller })
                .enableNativeMediaPlayer({ enable: false, shouldOverlay: this.shouldOverlay })
                .onPageBegin((event: PageBeginParam) => {
                    console.error('enter onPageBegin, url:' + event.url);
                    console.error(' in onPageBegin, onCreateNativeMediaPlayer:' + this.controller.onCreateNativeMediaPlayer);
                    let callback: webview.CreateNativeMediaPlayerCallback =
                        (handler: webview.NativeMediaPlayerHandler, mediaInfo: webview.MediaInfo) => {
                            this.isNoCallback = false
                            console.log('mediaInfo' + JSON.stringify(mediaInfo))
                            this.nativePlayer = new NativeMediaPlayerImpl(this, new NativeMediaPlayerHandlerImpl(handler), mediaInfo);
                            return this.nativePlayer;
                        }
                    this.controller.onCreateNativeMediaPlayer(callback);
                    this.controller.pauseAllMedia();
                    console.error('exit onPageBegin');
                })
                .onPageEnd((event) => {
                  console.log('onPageEnd url:' + event.url);
                  this.isPageEnd = 1;
               })
                .width('100%')
                .height('100%')

          }
      }
  }
}
                    
   
