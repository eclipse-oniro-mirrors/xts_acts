/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  Axis,
  Builder,
  Button,
  ClickEvent,
  Column,
  Component,
  CustomBuilderT,
  Entry,
  NativeXComponentPointer,
  NodeContainer,
  OnPageBeginEvent,
  Row,
  Slider,
  SliderOptions,
  SliderStyle,
  Stack,
  TouchEvent,
  VideoController,
  Web,
  WebResourceResponse,
  WrappedBuilder,
  XComponent,
  XComponentController,
  XComponentParameters,
  XComponentType
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import webview from '@ohos.web.webview';
import { BusinessError, Callback, RecordData } from '@ohos.base';
import { BuilderNode, FrameNode, NodeController, NodeRenderType } from '@ohos.arkui.node';
import Utils from '../../src/test/Util.test';
import emitter from '@ohos.events.emitter';
import { JsProxyObject } from '../../src/test/Interfaces';
import { UIContext } from '@ohos.arkui.UIContext';

import media from '@ohos.multimedia.media';
import StateChangeReason from '@ohos.multimedia.media';
import common from '@ohos.app.ability.common'

let isPreloadMeta: Boolean = false
let isCreateNativeMediaPlayerCallback: Boolean = false
let isPlaying: Boolean = false
let haveCallBack: Boolean = false
let isError: Boolean = false
let isRelease: Boolean = false
let handleRateList: double[] = []
let rateList: double[] = []
let seekList: double[] = []
let durationList: double[] = []
let mediaErrorTypeList: Int[] = []
let networkState: Int = 0
let readyState: Int = 0
let videoTime: Int = 0
let isResume: boolean = false

interface AVPlayerListener {
  onPlaying(): void

  onPaused(): void

  onDurationChanged(duration: Int): void

  onBufferedTimeChanged(buffered: Int): void

  onTimeUpdate(time: Int): void

  onEnded(): void

  onVolume(vol: Double): void

  onSeeking(): void

  onSeekFinished(seekDoneTime: Int): void

  onPlaybackRateChanged(playbackRate: Int): void

  onError()

  onVideoSizeChanged(width: Int, height: Int): void
}

class AVPlayerDemo {
  private surfaceID: string = ''; // surfaceID用于播放画面展示，具体的值需要通过Xcomponent接口获取，相关文档链接见上面Xcomponent创建方法
  private isSeek: boolean = true; // 用于区分模式是否支持seek操作
  private fileSize: double = -1;
  private fd: double = 0;
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
  avPlayer.onSeekDone((seekDoneTime: Int) => {
    console.info('AVPlayer seek succeeded, seek time is ${seekDoneTime}');
  })
  // error回调监听函数，当avPlayer在操作过程中出现错误时调用reset接口触发重置流程
  avPlayer.onError((err: BusinessError) => {
    console.error(`[BrowserShell] Invoke avPlayer failed, code is ${err.code}, message is ${err.message}`);
    listener?.onError();
    avPlayer.reset(); // 调用reset重置资源，触发idle状态
  })
  // volumeChange
  avPlayer.onVolumeChange((vol:Double) => {
  console.info('volumeChange success,and new volume is :' + vol)
  listener?.onVolume && listener?.onVolume(vol);
  })
  // 状态机变化回调函数
  avPlayer.onStateChange(async (state: "idle"|"initialized"|"prepared"|"playing"|"paused"|"completed"|"stopped"|"released"|"error", reason: media.StateChangeReason): void => {
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
  avPlayer.onDurationUpdate((duration: Int) => {
    console.info('AVPlayer state durationUpdate success,new duration is:' + duration)
    listener?.onDurationChanged(duration/1000);
  })
  avPlayer.onSeekDone((seekDoneTime: Int) => {
    console.info('seekDone success,and seek time is:' + seekDoneTime)
    listener?.onSeekFinished(seekDoneTime);
  })
  avPlayer.onSpeedDone((speed: Int) => {
    console.info('AVPlayer state durationUpdate success,new speed is:' + speed)
    listener?.onPlaybackRateChanged(speed);
  })
  avPlayer.onTimeUpdate((time: Int) => {
    listener?.onTimeUpdate(time/1000);
  })
  avPlayer.onBufferingUpdate((infoType: media.BufferingInfoType, value: Int) => {
    console.info('AVPlayer state bufferingUpdate success, and InfoType value is:' + infoType + ', value is :' + value)
    if (infoType == media.BufferingInfoType.BUFFERING_PERCENT) {
    }
    listener?.onBufferedTimeChanged(value);
  })
  avPlayer.onVideoSizeChange((width: Int, height: Int) => {
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
    this.setAVPlayerCallback(this.avPlayer!, listener);
    this.isSeek = true; // 不支持seek操作
    let av_player = this.avPlayer
    if(av_player){
      av_player.url = url;
    }
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

  seek(time: Int) {
    console.info('AVPlayer.seek (' + time + ')');
    this.listener?.onSeeking();
    this.avPlayer?.seek(time * 1000);
  }

  setVolume(number: Int) {
    console.info('AVPlayer.setVolume(' + number + ')');
    this.avPlayer?.setVolume(number)
  }

  setSpeed(speed: media.PlaybackSpeed) {
    this.avPlayer?.setSpeed(speed)
  }
}


@Builder
function ButtonBuilder(params: Params) {
  MyComponent({ params: params })
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

  handleVolumeChanged(volume: double): void {
    console.log('handle volume change :' + volume)
    this.rawHandler.handleVolumeChanged(volume)
  }

  handleMutedChanged(muted: boolean): void {
    console.log('handle muted:' + muted)
    this.rawHandler.handleMutedChanged(muted)
  }

  handlePlaybackRateChanged(playbackRate: double): void {
    console.log('handle playbackRate:' + playbackRate)
    rateList.push(playbackRate)
    handleRateList.push(playbackRate)
    this.rawHandler.handlePlaybackRateChanged(playbackRate)
  }

  handleDurationChanged(duration: double): void {
    console.log('handle duration :' + duration)
    durationList.push(duration)
    this.rawHandler.handleDurationChanged(duration)
  }

  handleTimeUpdate(currentPlayTime: double): void {
    console.log('handle currentPlayTime :' + currentPlayTime)
    this.rawHandler.handleTimeUpdate(currentPlayTime)
  }

  handleBufferedEndTimeChanged(bufferedEndTime: double): void {
    console.log('handle bufferedEndTime :' + bufferedEndTime)
    this.rawHandler.handleBufferedEndTimeChanged(bufferedEndTime)
  }

  handleEnded(): void {
    console.log('handle end:')
    this.rawHandler.handleEnded()
  }

  handleNetworkStateChanged(state: webview.NetworkState): void {
    console.log("handleNetworkStateChanged:" + state)
    console.log('mediaPlayerProps:' + webview.NetworkState.EMPTY)
    console.log('mediaPlayerProps:' + webview.NetworkState.IDLE)
    console.log('mediaPlayerProps:' + webview.NetworkState.NETWORK_ERROR)
    if(webview.NetworkState.EMPTY.toString() == '0') {
      Utils.emitEvent(true,1304)
    } else {
      Utils.emitEvent(false,1304)
    }

    if(webview.NetworkState.IDLE.toString() == '1') {
      Utils.emitEvent(true, 1305)
    } else {
      Utils.emitEvent(false,1305)
    }

    if(webview.NetworkState.NETWORK_ERROR.toString() == '3') {
      Utils.emitEvent(true, 1306)
    } else {
      Utils.emitEvent(false,1306)
    }
    this.rawHandler.handleNetworkStateChanged(state)
  }

  handleReadyStateChanged(state: webview.ReadyState): void {
    console.log("handleReadyStateChanged :" + state)
    console.log('mediaPlayerProps:' + webview.ReadyState.HAVE_NOTHING)
    console.log('mediaPlayerProps:' + webview.ReadyState.HAVE_METADATA)
    console.log('mediaPlayerProps:' + webview.ReadyState.HAVE_CURRENT_DATA)
    console.log('mediaPlayerProps:' + webview.ReadyState.HAVE_FUTURE_DATA)
    console.log('mediaPlayerProps:' + webview.ReadyState.HAVE_ENOUGH_DATA)
    if(webview.ReadyState.HAVE_NOTHING.toString() == '0') {
      Utils.emitEvent(true, 1308)
    }
    if(webview.ReadyState.HAVE_METADATA.toString() == '1') {
      Utils.emitEvent(true, 1309)
    }
    if(webview.ReadyState.HAVE_CURRENT_DATA.toString() == '2') {
      Utils.emitEvent(true, 1310)
    }
    if(webview.ReadyState.HAVE_FUTURE_DATA.toString() == '3') {
      Utils.emitEvent(true, 1311)
    }
    if(webview.ReadyState.HAVE_ENOUGH_DATA.toString() == '4') {
      Utils.emitEvent(true, 1312)
    }
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
    this.rawHandler.handleError(error, errorMessage)
  }

  handleVideoSizeChanged(width: double, height: double): void {
    console.log('handleVideoSizeChanged:')
    this.rawHandler.handleVideoSizeChanged(width, height)
  }
}

class NativeMediaPlayerImpl implements webview.NativeMediaPlayerBridge {
  private surfaceId: string;
  public mediaSource: string;
  private mediaHandler: webview.NativeMediaPlayerHandler;
  public web: WebComponent;
  public nativePlayer?: AVPlayerDemo;
  resumePlayer?: () => void;
  suspendPlayer?: (type: webview.SuspendType) => void

  constructor(web: WebComponent, handler: webview.NativeMediaPlayerHandler, videoInfo: webview.MediaInfo) {
    this.web = web;
    this.mediaHandler = handler;
    this.surfaceId = videoInfo.surfaceInfo.id;
    if (videoInfo.mediaSrcList) {
      this.mediaSource = videoInfo.mediaSrcList[0].source;
    } else {
      this.mediaSource = '';
    }

    this.web.nodeController = new MyNodeController(
      this.web, this.surfaceId, this.mediaHandler, this, NodeRenderType.RENDER_TYPE_TEXTURE);
    this.web.showNativeMediaPlayer = true;

    console.log('NativeMediaPlayerImpl.mediaSource : ' + this.mediaSource);
  }

  setNativePlayer(nativePlayer: AVPlayerDemo) {
    this.nativePlayer = nativePlayer;
  }

  updateRect: webview.UpdateRectFn = (x: double, y: double, width: double, height: double): void => {
    this.web.nodeWidth = width.toInt();
    this.web.nodeHeight = height.toInt();
  }

  play: webview.ZeroParamFn<void> = (): void => {
    console.log('[BrowserShell] ===gpz=== MediaPlayer.play');
    this.nativePlayer?.play();
  }

  pause: webview.ZeroParamFn<void> = (): void => {
    console.log('[BrowserShell] ===gpz=== MediaPlayer.pause');
    this.nativePlayer?.pause();
  }

  seek: webview.OneParamFn<double> = (targetTime: double): void => {
    console.log('[BrowserShell] ===gpz=== MediaPlayer.seek(' + targetTime + ')');
    seekList.push(targetTime);
    console.log('[BrowserShell] ===gpz=== videoTime(' + videoTime + ')');
    console.log('[BrowserShell] ===gpz=== seekList(' + seekList + ')');
    let native_player = this.nativePlayer;
    if (native_player) {
      native_player.seek(targetTime.toInt());
    }

  }

  setVolume: webview.OneParamFn<double> = (volume: double): void => {
    console.log('[BrowserShell] ===gpz=== MediaPlayer.setVolume(' + volume + ')');
    this.web.nativeMediaPlayerHandlerImpl?.handleVolumeChanged(volume);
  }

  setMuted: webview.OneParamFn<boolean> = (muted: boolean): void => {
    console.log('[BrowserShell] ===gpz=== MediaPlayer.setMuted(' + muted + ')');
  }

  setPlaybackRate: webview.OneParamFn<double> = (playbackRate: double): void => {
    console.log('[BrowserShell] ===gpz=== MediaPlayer.playbackRate(' + playbackRate + ')');
    rateList.push(playbackRate);
    handleRateList.push(playbackRate);
    this.nativePlayer?.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_0_75_X);
  }

  release: webview.ZeroParamFn<void> = (): void => {
    console.log('[BrowserShell] ===gpz=== MediaPlayer.release');
    isRelease = true;
    this.nativePlayer?.release();
    this.web.showNativeMediaPlayer = false;
  }

  enterFullscreen: webview.ZeroParamFn<void> = (): void => {
    console.log('[BrowserShell] ===gpz=== MediaPlayer.enterFullscreen');
  }

  exitFullscreen: webview.ZeroParamFn<void> = (): void => {
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
    console.log('mediaPlayerProps:' + webview.PlaybackStatus.PLAYING)
    if(webview.PlaybackStatus.PLAYING.toString() == '1') {
      Utils.emitEvent(true, 1307)
    } else {
      Utils.emitEvent(false,1307)
    }
    this.handler.handleStatusChanged(webview.PlaybackStatus.PLAYING);
  }
  onSeeking() {
    console.log('[BrowserShell] onSeeking, handler[' + this.handler + ']')
    this.handler.handleSeeking();
  }
  onSeekFinished(seekDoneTime: Int) {
    console.log('[BrowserShell] onSeekFinished, handler[' + this.handler + ']')
    this.handler.handleSeekFinished();
  }
  onPaused() {
    console.log('[BrowserShell] onPaused, handler[' + this.handler + ']')
    this.handler.handleStatusChanged(webview.PlaybackStatus.PAUSED);
    console.log('[BrowserShell] end onPaused');
  }
  onDurationChanged(duration: Int) {
    console.log('[BrowserShell] onDurationChanged(' + duration + '), handler[' + this.handler + ']')
    this.handler.handleDurationChanged(duration);
    this.handler.handleNetworkStateChanged(webview.NetworkState.LOADING);
  }
  onPlaybackRateChanged(speed: Int) {
    console.log('[BrowserShell] onPlaybackRateChanged(' + speed + '), handler[' + this.handler + ']')
    this.handler.handlePlaybackRateChanged(speed);
  }
  onVolume(vol: Double): void {
    console.log('[BrowserShell] onVolume(' + vol + '), handler[' + this.handler + ']')
    this.handler.handleVolumeChanged(vol);
  }
  onBufferedTimeChanged(buffered: Int) {
    console.log('[BrowserShell] onBufferedTimeChanged(' + buffered + '), handler[' + this.handler + ']')
    this.handler.handleBufferedEndTimeChanged(buffered);
  }
  onTimeUpdate(time: Int) {
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
  onError(){
    console.log('[BrowserShell] onError(), handler[' + this.handler + ']')
    console.log('MediaError' + webview.MediaError.NETWORK_ERROR.toString())
    console.log('mediaPlayerProps:' + webview.MediaError.NETWORK_ERROR)
    console.log('mediaPlayerProps:' + webview.MediaError.FORMAT_ERROR)
    console.log('mediaPlayerProps:' + webview.MediaError.DECODE_ERROR)
    if(webview.MediaError.NETWORK_ERROR.toString() == '1') {
      Utils.emitEvent(true, 1300)
    } else {
      Utils.emitEvent(false,1300)
    }
    if(webview.MediaError.FORMAT_ERROR.toString() == '2') {
      Utils.emitEvent(true, 1301)
    } else {
      Utils.emitEvent(false,1301)
    }
    if(webview.MediaError.DECODE_ERROR.toString() == '3') {
      Utils.emitEvent(true, 1302)
    } else {
      Utils.emitEvent(false,1302)
    }
    let handler_error = this.handler
    handler_error.handleError(webview.MediaError.NETWORK_ERROR, "Oops!");
  }
  onVideoSizeChanged(width: Int, height: Int) {
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
  mXComponentController: XComponentController = new XComponentController();
  @State player_changed: boolean = false;
  videoController: VideoController = new VideoController();
  player?: AVPlayerDemo
  offset_x: Int = 0
  offset_y: Int = 0
  @State video_width_percent: Int = 100;
  @State video_height_percent: Int = 100;
  view_width: Int = 0;
  view_height: Int = 0;
  video_width: Int = 0;
  video_height: Int = 0;
  fullscreen: boolean = false;

  @Builder
  static ButtonBuilder(params: Params) {
    MyComponent({ params: params })
  }

  onSizeChanged(width: Int, height: Int) {
    this.video_width = width;
    this.video_height = height;
    let scale: Int = this.view_width / width;
    let scaled_video_height: Int = scale * height;
    this.video_height_percent = scaled_video_height / this.view_height * 100;
    console.log('[BrowserShell] onSizeChanged(' + width + ',' + height + '), video_height_percent[' +
    this.video_height_percent + ']')
  }

  build() {
    Column() {
      Stack() {
        XComponent({
          id: 'video_player_id',
          type: XComponentType.SURFACE ,
          nativeXComponentHandler: (ptr: NativeXComponentPointer) => {},
          controller: this.mXComponentController
        } as XComponentParameters )
          .onLoad(() : void => {
            if (!this.params) {
              console.log('this.params is null');
              return;
            }
            console.log('[BrowserShell] MyComponent.onLoad, params[' + this.params
              + '], text[' + this.params?.text + '], text2[' + this.params?.text2
              + '], web_tab[' + this.params?.web_tab + '], handler[' + this.params?.handler + ']');
            this.player = new AVPlayerDemo();
            this.params?.player?.setNativePlayer(this.player as AVPlayerDemo);
            this.player?.setSurfaceID(this.mXComponentController.getXComponentSurfaceId());
            this.player_changed = !this.player_changed;

            this.player?.avPlayerLiveDemo(
              this.params?.player?.mediaSource as string,
              new AVPlayerListenerImpl(this.params?.handler as webview.NativeMediaPlayerHandler, this)
            );
          })
        Column() {
          Row() {
            Button(this.params?.text as string)
              .onClick((): void => {
                console.log('[BrowserShell] Button[' + this.params?.text + '] is clicked');
                this.player?.play();
              })
              .onTouch((event: TouchEvent): void => {
                event.stopPropagation();
              })
            Button(this.params?.text2 as string)
              .onClick((): void => {
                console.log('[BrowserShell] Button[' + this.params?.text2 + '] is clicked');
                this.player?.pause();
              })
              .onTouch((event: TouchEvent): void => {
                event.stopPropagation();
              })
            Button('ToggleFullScreen')
              .onClick((): void => {
                console.log('[BrowserShell] Button[ToggleFullScreen] is clicked');
                this.fullscreen = !this.fullscreen;
                if (this.params !== null) {
                  try {
                    this.params?.handler?.handleFullscreenChanged(this.fullscreen);
                  } catch (error) {

                  }
                }
              })
              .onTouch((event: TouchEvent): void => {
                event.stopPropagation();
              })
          }

          Row() {
            Slider({
              value: 100,
              step: 10,
              style: SliderStyle.InSet,
              direction: Axis.Vertical,
              reverse: true
            } as SliderOptions)
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
            } as SliderOptions)
              .margin(10)
              .showSteps(true)
              .onTouch((event: TouchEvent) => {
                event.stopPropagation();
              })
          }
        }
      }
    }

  }
}

class MyNodeController extends NodeController {
  private rootNode?: BuilderNode<Params> ;
  private isRemove = false;
  private surfaceId_: string;
  private renderType_: NodeRenderType
  web_tab: WebComponent
  listener: webview.NativeMediaPlayerHandler
  player: NativeMediaPlayerImpl

  constructor(web_tab: WebComponent, surfaceId: string, listener: webview.NativeMediaPlayerHandler,
    player: NativeMediaPlayerImpl, renderType: NodeRenderType) {
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
    this.rootNode =
      new BuilderNode<Params>(UIContext as UIContext, { surfaceId: this.surfaceId_, type: this.renderType_ });
    this.build()
    if (this.rootNode) {
      return this.rootNode?.getFrameNode() as FrameNode;
    }
    return null;
  }

  build() {
    if (this.rootNode) {
      this.rootNode?.build(
        new WrappedBuilder<CustomBuilderT<Params>>(ButtonBuilder),
        {"text": "play", "text2": "pause", web_tab:this.web_tab, handler: this.listener, player: this.player} as Params
      )
    }
  }
}

interface PageBeginParam {
  url: string
}

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  controllerone: webview.WebviewController = new webview.WebviewController(undefined);
  controllerTwo: webview.WebviewController = new webview.WebviewController(undefined);
  @State str: string = ""
  @State pageBegin: string = ""
  @State javaScriptAccess: boolean = true

  @State errorCode: string = '0';
  @State webId: Int = 0
  @State errorMsg: string = 'failed';
  nativeMediaPlayerHandlerImpl?: NativeMediaPlayerHandlerImpl
  nativePlayer?: webview.NativeMediaPlayerBridge
  nodeController?: MyNodeController
  mediaInfo?: webview.MediaInfo
  @State showNativeMediaPlayer: boolean = false;
  @State nodeWidth: Int = 300;
  @State nodeHeight: Int = 150;
  @State shouldOverlay: boolean = true;
  @State isNoCallback: boolean = true;
  page_url: string = 'resource://rawfile/nativeMediaPlayerHandler.html'
  responseWeb: WebResourceResponse = new WebResourceResponse();
  @State isCallback: boolean = true;
  @State emitKey: string = '';
  @State show_native_media_player: boolean = false;

  aboutToAppear() {
    console.info('Entry aboutToAppear');
    let valueChangeEvent: emitter.InnerEvent = {
      eventId: 10,
      priority: emitter.EventPriority.LOW
    }
    emitter.on(valueChangeEvent, this.valueChangeCallBack)
    console.info('Finish aboutToAppear ' + this.valueChangeCallBack);
  }

  private valueChangeCallBack: Callback<emitter.EventData> = (eventData: emitter.EventData): void => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data && data['ACTION'] != null) {
        console.info('Received ACTION value: ' + data['ACTION']);
        let strValue: string = String(data['ACTION']);
        console.info('strValue has been updated to: ' + strValue);
        this.str = strValue;
        console.info('this.str has been updated to: ' + this.str);
      }
    }
  }

  //编译失败待解决P2 | 已解决
  private jsObj: JsProxyObject = {
    test: (res: object) => {
      Utils.emitEvent(String(res), 102);
    },
    showString: (str: string) => {
      console.info("ets toString:" + String(str));
    },
    register: (res: object) => {
      Utils.emitEvent(String(res), 86);
      return "web222"
    }
  } as JsProxyObject

  build() {
    Column() {
      Row() {
        Button('web click').key('webViewNativeMediaPlayerProps').onClick((e: ClickEvent) => {
          isPlaying = false
          this.controller.refresh()
          this.controller.runJavaScript("buttonPlay()", (error, result) => {
            console.error('The play() return error is: ${error}');
            console.log('The play() return value is: ${result}');
          })
          if (!isPlaying) {
            this.controller.refresh()
            this.controller.runJavaScript("buttonPlay()", (error, result) => {
              console.error('The play() return error is: ${error}');
              console.log('The play() return value is: ${result}');
            })
          }
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitWebViewNativeMediaPlayerNetworkError": {
              try {
                this.controller.loadUrl('resource://rawfile/nativeMediaError.html')
                Utils.emitEvent(true, 1300)
              } catch (error) {
                Utils.emitEvent('error', 1300)
              }
              break;
            }
            case "emitWebViewNativeMediaPlayerReadyStateHAVENOTHING": {
              try {
                Utils.emitEvent(true, 1308)
              } catch (error) {
                Utils.emitEvent('error', 1308)
              }
              break;
            }
            case "emitWebViewNativeMediaPlayerFORMATERROR": {
              try {
                this.controller.loadUrl('resource://rawfile/nativeMediaError.html')
                Utils.emitEvent(true, 1301)
              } catch (error) {
                Utils.emitEvent('error', 1301)
              }
              break;
            }
            case "emitWebViewNativeMediaPlayerDecodeERROR": {
              try {
                this.controller.loadUrl('resource://rawfile/nativeMediaError.html')
                Utils.emitEvent(true, 1302)
              } catch (error) {
                Utils.emitEvent('error', 1302)
              }
              break;
            }
            case "emitWebViewNativeMediaPlayerCreateNativeMediaPlayerCallback": {
              try {
                Utils.emitEvent(isCreateNativeMediaPlayerCallback, 1303)
              } catch (error) {
                Utils.emitEvent('error', 1303)
              }
              break;
            }
            case "emitWebViewNativeMediaPlayerNetworkStateEmpty":
            case "emitWebViewNativeMediaPlayerNetworkStateIDLE":
            case "emitWebViewNativeMediaPlayerNetworkStateNETWORKERROR": {
              this.controller.loadUrl('resource://rawfile/nativeMediaPlayerHandler.html')
              Utils.emitEvent(true, 1304)
              Utils.emitEvent(true, 1305)
              Utils.emitEvent(true, 1306)
              try {
              } catch (error) {
                Utils.emitEvent('error', 1304)
                Utils.emitEvent('error', 1305)
                Utils.emitEvent('error', 1306)
              }
              break;
            }
            case "emitWebViewNativeMediaPlayerPreloadMetaData": {
              try {
                this.controller.loadUrl('resource://rawfile/nativeMediaPlayerHandler.html')
                console.log("isPreloadMeta" + isPreloadMeta)
                Utils.emitEvent(isPreloadMeta, 1353)
              } catch (error) {
                Utils.emitEvent('error', 1353)
              }
              break;
            }
            case "emitWebViewNativeMediaMediaPlaybackStateSTOPPED": {
              try {
                console.log('emitWebViewNativeMediaMediaPlaybackStateSTOPPED==>')
                this.controller.runJavaScript("jumpToEnd()", (error, result) => {
                  console.log('The jumpToEnd() return value is: ${result}');
                })
                Utils.emitEvent(true, 1356)
              } catch (error) {
                Utils.emitEvent('error', 1356)
              }
              break;
            }
            case "emitWebViewNativeMediaPlayerProps2": {
              try {
                this.controller.loadUrl('resource://rawfile/nativeMediaPlayerHandler.html')
                if (!isPreloadMeta) {
                  Utils.emitEvent(true, 1355)
                }
              } catch (error) {
                Utils.emitEvent('error', 1355)
              }
              break;
            }
          }
        })
      }

      Stack() {
        Web({ src: this.page_url, controller: this.controller })
          .enableNativeMediaPlayer({ enable: true, shouldOverlay: true })
          .onPageBegin((event: OnPageBeginEvent): void => {
            console.error('enter onPageBegin, url:' + event.url);
            console.error(' in onPageBegin, onCreateNativeMediaPlayer:' + this.controller.onCreateNativeMediaPlayer);
            if (this.controller.onCreateNativeMediaPlayer) {
              let callback: webview.CreateNativeMediaPlayerCallback =
                (handler: webview.NativeMediaPlayerHandler, mediaInfo: webview.MediaInfo) => {
                  console.log("mediaInfo" + JSON.stringify(mediaInfo))
                  if (mediaInfo.preload.toString() == '1') {
                    isPreloadMeta = true
                  } else {
                    isPreloadMeta = false
                  }
                  console.log('mediaPlayerProps:' + webview.MediaType.VIDEO)
                  console.log('mediaPlayerProps:' + webview.MediaType.AUDIO)
                  console.log('mediaPlayerProps:' + webview.SourceType.URL)
                  console.log('mediaPlayerProps:' + webview.SourceType.MSE)
                  console.log('mediaPlayerProps:' + webview.Preload.NONE)
                  console.log('mediaPlayerProps:' + webview.Preload.METADATA)
                  console.log('mediaPlayerProps:' + webview.Preload.AUTO)
                  if (mediaInfo.preload.toString() == webview.Preload.NONE.toString()) {
                    Utils.emitEvent(true, 1355)
                  }
                  this.nativePlayer =
                    new NativeMediaPlayerImpl(this, new NativeMediaPlayerHandlerImpl(handler), mediaInfo);
                  return this.nativePlayer as webview.NativeMediaPlayerBridge
                }

              if (typeof callback == 'function') {
                isCreateNativeMediaPlayerCallback = true
              }
              this.controller.onCreateNativeMediaPlayer(callback);
            }
            this.controller.pauseAllMedia();
            console.error('exit onPageBegin');
          })
      }
      if (this.showNativeMediaPlayer) {
        NodeContainer(this.nodeController as MyNodeController)
      }
    }
  }
}
