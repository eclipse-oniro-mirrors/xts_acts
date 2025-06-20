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
import { Driver, ON } from '@ohos.UiTest';
import Want from '@ohos.app.ability.Want';

let isPlaying: Boolean = false
let haveCallBack: Boolean = false
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
    this.rawHandler.handlePlaybackRateChanged(playbackRate)
  }

  handleDurationChanged(duration: number): void {
    console.log('handle duration :' + duration)
    durationList.push(duration)
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
    networkStateList.push(state)
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
    console.log('[handleError] [' + mediaErrorTypeList + ']')
    console.log('mediaErrorTypeList -->' + mediaErrorTypeList);
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

  resumePlayer?() {
    console.log('[BrowserShell] ===gpz=== MediaPlayer.resumePlayer')
  }
  suspendPlayer?(type: webview.SuspendType) {
    console.log('[BrowserShell] ===gpz=== MediaPlayer.suspendPlayer type is: ' + type)
    if (type === webview.SuspendType.ENTER_BACK_FORWARD_CACHE){
      haveCallBack = true
      Utils.emitEvent('success', 10001)
    }
    if (type === webview.SuspendType.ENTER_BACKGROUND){
      Utils.emitEvent('success', 10002)
    }
    if (type === webview.SuspendType.AUTO_CLEANUP){
      Utils.emitEvent('success', 10003)
    }
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
    this.handler.handleBufferedEndTimeChanged(buffered);
  }
  onTimeUpdate(time: number) {
    console.log('[BrowserShell] onTimeUpdate(' + time + '), handler[' + this.handler + ']')
    this.handler.handleTimeUpdate(time);
    timeUpdateList.push(time)
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
    this.handler.handleNetworkStateChanged(webview.NetworkState.NETWORK_ERROR);
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
  responseWeb: WebResourceResponse = new WebResourceResponse();
  private context = getContext(this) as common.UIAbilityContext;
  @State showNativeMediaPlayer: boolean = false;
  @State nodeWidth : number = 300;
  @State nodeHeight : number = 150;
  @State isShouldOverlay : boolean = true;
  @State isCallback : boolean = true;
  @State singleWebData: string = `<!DOCTYPE html>
      <html lang="en">
      <head>
      <meta charset='utf-8'>
      <meta name='viewport' content='width=device-width, initial-scale=1'>
      <title>HTML5 Video</title>
      <style>
      body {  background-color: black; color: #ffffe0; font-family: Arial, sans-serif; }
      video {
        border: 1px solid black;
        padding: 0; margin: 0;
        width: 427px;
        height: 240px;
        background-color: black;
        margin: auto;
        float: left;
      }

      a { color: #ffffe0;}

      table { border: none; margin: auto; margin-top: 1ex;}
      th {  text-align: right; }
      caption { background-color: #ffffe0; color: black;}
      thead th {  background-color: #ffffe0; color: black;}
      #events td { text-align: right; width: 4ex;}
      #properties td { }
      hr { clear: both; margin-top: 2em;}
      .true { background-color: #360; color: #ffffe0; }
      .false { background-color: #603; color: #ffffe0; }
      #buttons { text-align: center; }

      #m_video td, #m_video th, #tracks td, #tracks tth { text-align: center; padding-left: 0.5ex; padding-right: 0.5ex;}
      </style>

      <script>
          var videoList = document.getElementsByTagName("video");

          function handlePlay(i) {
              for (let j = 0; j < videoList.length; j++) {
                  if (i != j) {
                      videoList[j].pause();
                  }
              }
          }

          function handleEnded(i) {
              var currVideo = videoList[i];
              currVideo.pause();

              var nextVideo;
              if ( i + 1 < videoList.length) {
                  nextVideo = videoList[i + 1];
              } else {
                  nextVideo = videoList[0];
              }
              nextVideo.play();
          }

          function handleClick() {
              window.location.href = 'https://www.baidu.com';
          }

          function handleBack() {
              history.back();
          }

          function handleForward() {
              history.forward();
          }
           function play() {
              document.getElementById('video').play()
              return 'play'
          }
          function buttonPlay() {
              document.getElementById('video').play()
              return 'play'
          }
      </script>

      </head>

      <body>
      <h1>HTML5 Video Events and API</h1>

      <a href="https://www.baidu.com">搜索链接</a>

      <video controls onplay="handlePlay(0);" onended="handleEnded(0);" id="video" autoplay muted>
          <source src="https://www.w3cschool.cn/statics/demosource/movie.mp4" type='video/mp4'>
          <p>Your user agent does not support the HTML5 Video element.</p>
      </video>
      <button onclick="handleBack()">后退</button>
      <button onclick="handleForward()">前进</button>
      </body>
    </html>`;
  @State multiWebData: string = `<!DOCTYPE html>
      <html lang="en">
      <head>
      <meta charset='utf-8'>
      <meta name='viewport' content='width=device-width, initial-scale=1'>
      <title>HTML5 Video</title>
      <style>
      body {  background-color: black; color: #ffffe0; font-family: Arial, sans-serif; }
      video {
        border: 1px solid black;
        padding: 0; margin: 0;
        width: 427px;
        height: 240px;
        background-color: black;
        margin: auto;
        float: left;
      }

      a { color: #ffffe0;}

      table { border: none; margin: auto; margin-top: 1ex;}
      th {  text-align: right; }
      caption { background-color: #ffffe0; color: black;}
      thead th {  background-color: #ffffe0; color: black;}
      #events td { text-align: right; width: 4ex;}
      #properties td { }
      hr { clear: both; margin-top: 2em;}
      .true { background-color: #360; color: #ffffe0; }
      .false { background-color: #603; color: #ffffe0; }
      #buttons { text-align: center; }

      #m_video td, #m_video th, #tracks td, #tracks tth { text-align: center; padding-left: 0.5ex; padding-right: 0.5ex;}
      </style>

      <script>
          var videoList = document.getElementsByTagName("video");

          function handlePlay(i) {
              for (let j = 0; j < videoList.length; j++) {
                  if (i != j) {
                      videoList[j].pause();
                  }
              }
          }

          function handleEnded(i) {
              var currVideo = videoList[i];
              currVideo.pause();

              var nextVideo;
              if ( i + 1 < videoList.length) {
                  nextVideo = videoList[i + 1];
              } else {
                  nextVideo = videoList[0];
              }
              nextVideo.play();
          }
          function playById(videoId) {
              document.getElementById(videoId).play()
              return 'play'
          }
          function handleClick() {
              window.location.href = 'https://www.baidu.com';
          }
      </script>

      </head>

      <body>
      <h1>HTML5 Video Events and API</h1>

      <a href="https://www.baidu.com">搜索链接</a>

      <video id='video0' muted controls onplay="handlePlay(0);" onended="handleEnded(0);">
          <source src="https://www.w3cschool.cn/statics/demosource/movie.mp4" type='video/mp4'>
          <p>Your user agent does not support the HTML5 Video element.</p>
      </video>
      <video id='video1' muted controls onplay="handlePlay(1);" onended="handleEnded(1);">
          <source src="https://www.w3cschool.cn/statics/demosource/movie.mp4" type='video/mp4'>
          <p>Your user agent does not support the HTML5 Video element.</p>
      </video>
      <video id='video2' muted controls onplay="handlePlay(2);" onended="handleEnded(2);">
          <source src="https://www.w3cschool.cn/statics/demosource/movie.mp4" type='video/mp4'>
          <p>Your user agent does not support the HTML5 Video element.</p>
      </video>
      <video id='video3' muted controls onplay="handlePlay(3);" onended="handleEnded(3);">
          <source src="https://www.w3cschool.cn/statics/demosource/movie.mp4" type='video/mp4'>
          <p>Your user agent does not support the HTML5 Video element.</p>
      </video>
      <video id='video4' muted controls onplay="handlePlay(4);" onended="handleEnded(4);">
          <source src="https://www.w3cschool.cn/statics/demosource/movie.mp4" type='video/mp4'>
          <p>Your user agent does not support the HTML5 Video element.</p>
      </video>
      <video id='video5' muted controls onplay="handlePlay(5);" onended="handleEnded(5);">
          <source src="https://www.w3cschool.cn/statics/demosource/movie.mp4" type='video/mp4'>
          <p>Your user agent does not support the HTML5 Video element.</p>
      </video>
      <video id='video6' muted controls onplay="handlePlay(6);" onended="handleEnded(6);">
          <source src="https://www.w3cschool.cn/statics/demosource/movie.mp4" type='video/mp4'>
          <p>Your user agent does not support the HTML5 Video element.</p>
      </video>
      <video id='video7' muted controls onplay="handlePlay(7);" onended="handleEnded(7);">
          <source src="https://www.w3cschool.cn/statics/demosource/movie.mp4" type='video/mp4'>
          <p>Your user agent does not support the HTML5 Video element.</p>
      </video>
      <video id='video8' muted controls onplay="handlePlay(8);" onended="handleEnded(8);">
          <source src="https://www.w3cschool.cn/statics/demosource/movie.mp4" type='video/mp4'>
          <p>Your user agent does not support the HTML5 Video element.</p>
      </video>
      <video id='video9' muted controls onplay="handlePlay(9);" onended="handleEnded(9);">
          <source src="https://www.w3cschool.cn/statics/demosource/movie.mp4" type='video/mp4'>
          <p>Your user agent does not support the HTML5 Video element.</p>
      </video>
            <video id='video10' muted controls onplay="handlePlay(10);" onended="handleEnded(10);">
          <source src="https://www.w3cschool.cn/statics/demosource/movie.mp4" type='video/mp4'>
          <p>Your user agent does not support the HTML5 Video element.</p>
      </body>
      </html>`;

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
      while(retryTime < 3 && !isPlaying) {
        if (emitKey != this.emitKey) {
          console.log( 'not same key:' + emitKey + ' new emitKey:' + this.emitKey )
          return
        }
        if(!isPlaying) {
          console.log('retry playing' + this.emitKey)
          if(retryTime < 2) {
            if (emitKey != this.emitKey) {
              console.log( 'not same key:' + emitKey + ' new emitKey:' + this.emitKey )
              return
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
        await this.controller.runJavaScript('buttonPlay()')
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('跳转').key('webviewBFCacheButton').onClick(async () => {
          await Utils.sleep(2000)
          console.log('webviewBFCacheButton start');
          let wantInfo:Want = {
            deviceId: '',
            bundleName: 'com.open.harmony.forwardbackwardcachefivetest',
            moduleName: '',
            abilityName: 'com.example.myapplication.TestAbility2',
            parameters: {
              info: 'com.example.myapplication.TestAbility2'
            }
          }
          console.log('webviewBFCacheButton end');
          this.context.startAbility(wantInfo).then((result) => {
            console.log('webviewBFCacheButton result: ' + result);
          }).catch((err: BusinessError) => {
            // 处理业务逻辑错误
            console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
          });
          let driver = Driver.create()
          console.log('Driver.create start');
          let component = await driver.findComponent(ON.text('打开'))
          console.log('Driver.create end');
          await component.click();
        })
        Button('web click').key('webviewBFCacheSuspendPlayerButton').onClick(async () => {
          console.info('key==>' + this.emitKey)
          this.isShouldOverlay = true
          this.isCallback = false
          isPlaying = false
          haveCallBack = false
          await Utils.sleep(2000)
          if (Utils.isPC(this.controller) || Utils.isEmulator() ) {
            Utils.emitEvent('success', 10001)
            Utils.emitEvent('success', 10002)
            Utils.emitEvent('success', 10003)
            return
          }
          switch (this.emitKey) {
            case 'emitWebviewBFCacheSuspendPlayerZero': {
              this.controller.loadUrl('http://114.115.208.239:8070/colombo_test/single_video_1.html')
              await Utils.sleep(4000)
              this.controller.runJavaScript('buttonPlay()', (error, result) => {
                console.error(`The buttonPlay() return error is: ${error}`);
                console.log(`The buttonPlay() return value is: ${result}`);
              })
              await Utils.sleep(2000)
              this.controller.loadUrl('https://www.openharmony.cn/')
              await Utils.sleep(6000)
              if (haveCallBack === false) {
                Utils.emitEvent('success', 10001)
              }
              break;
            }
            case 'emitWebviewBFCacheSuspendPlayerOne': {
              this.controller.loadUrl('http://114.115.208.239:8070/colombo_test/single_video_1.html')
              await Utils.sleep(50000)
              this.controller.runJavaScript('buttonPlay()')
              await this.retryPlayingGen(this.emitKey)()
              sendEventByKey('webviewBFCacheButton', 10, '');
              break;
            }
            case 'emitWebviewBFCacheSuspendPlayerTwo': {
              this.controller.loadUrl('http://114.115.208.239:8070/colombo_test/multi_video.html')
              await Utils.sleep(6000)
              this.controller.runJavaScript('playById("video0")')
              await Utils.sleep(1000)
              this.controller.runJavaScript('playById("video1")')
              await Utils.sleep(1000)
              this.controller.runJavaScript('playById("video2")')
              await Utils.sleep(1000)
              this.controller.runJavaScript('playById("video3")')
              await Utils.sleep(1000)
              this.controller.runJavaScript('playById("video4")')
              await Utils.sleep(1000)
              this.controller.runJavaScript('playById("video5")')
              await Utils.sleep(1000)
              this.controller.runJavaScript('playById("video6")')
              await Utils.sleep(1000)
              this.controller.runJavaScript('playById("video7")')
              await Utils.sleep(1000)
              this.controller.runJavaScript('playById("video8")')
              await Utils.sleep(1000)
              this.controller.runJavaScript('playById("video9")')
              await Utils.sleep(1000)
              this.controller.runJavaScript('playById("video10")')
              await Utils.sleep(1000)
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
                  this.nativePlayer = new NativeMediaPlayerImpl(this,
                    this.nativeMediaPlayerHandlerImpl, mediaInfo);
                  console.info('onPageBegin key==>' + this.emitKey)
                  return this.nativePlayer;
                }

              this.controller.onCreateNativeMediaPlayer(callback);
            }
            this.controller.pauseAllMedia();
            console.error('exit onPageBegin');
          })
          .onPageEnd(async () => {
          })
          .onInterceptRequest((event) => {
            if (event) {
              console.log('url:' + event.request.getRequestUrl());
              let request = event.request.getRequestUrl()
              if (request == 'http://114.115.208.239:8070/colombo_test/single_video_1.html') {
                this.responseWeb.setResponseData(this.singleWebData);
              } else if (request == 'http://114.115.208.239:8070/colombo_test/multi_video.html') {
                this.responseWeb.setResponseData(this.multiWebData);
              } else {
                return null
              }
            }
            this.responseWeb.setResponseEncoding('utf-8');
            this.responseWeb.setResponseMimeType('text/html');
            this.responseWeb.setResponseCode(200);
            this.responseWeb.setReasonMessage('OK');
            return this.responseWeb;
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


