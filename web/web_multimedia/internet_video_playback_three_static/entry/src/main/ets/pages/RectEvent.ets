/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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


import { Entry, Component, Column, Row, Button, ClickEvent, Web,  $rawfile } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import Utils from '../../src/test/Util.test';
import webview from '@ohos.web.webview';
import emitter from '@ohos.events.emitter';
import events_emitter from '@ohos.events.emitter';
import { BusinessError, Callback, RecordData } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext'
import { canIUse } from '@internal.full.global'
import { Observed, State, AppStorage, ObjectLink } from '@kit.ArkUI';
import { XComponent, XComponentType, XComponentController, Text, Alignment, Resource, ForEach, Area, XComponentOptions,
  TouchEvent, Stack, Entry, Color, Component, Column, Row, Button, VideoController, Builder, Web, wrapBuilder,
  FrameNode, NodeContainer, FlexAlign } from '@kit.ArkUI';
import { NodeController, NodeRenderType, BuilderNode } from '@ohos.arkui.node';
export class StringFields {
  public str: string = '';
}

class ActualNativeMediaPlayerListener {
  handler: webview.NativeMediaPlayerHandler;

  constructor(handler: webview.NativeMediaPlayerHandler) {
    this.handler = handler;
  }

  onPlaying() {
    // 本地播放器开始播放。
    this.handler.handleStatusChanged(webview.PlaybackStatus.PLAYING);
  }
  onPaused() {
    // 本地播放器暂停播放。
    this.handler.handleStatusChanged(webview.PlaybackStatus.PAUSED);
  }
  onSeeking() {
    // 本地播放器开始执行跳转到目标时间点。
    this.handler.handleSeeking();
  }
  onSeekDone() {
    // 本地播放器 seek 完成。
    this.handler.handleSeekFinished();
  }
  onEnded() {
    // 本地播放器播放完成。
    this.handler.handleEnded();
  }
  onVolumeChanged() {
    // 获取本地播放器的音量。
    let volume: number = getVolume();
    this.handler.handleVolumeChanged(volume);
  }
  onCurrentPlayingTimeUpdate() {
    // 更新播放时间。
    let currentTime: number = getCurrentPlayingTime();
    // 将时间单位换算成秒。
    let currentTimeInSeconds = convertToSeconds(currentTime);
    this.handler.handleTimeUpdate(currentTimeInSeconds);
  }
  onBufferedChanged() {
    // 缓存发生了变化。
    // 获取本地播放器的缓存时长。
    let bufferedEndTime: number = getCurrentBufferedTime();
    // 将时间单位换算成秒。
    let bufferedEndTimeInSeconds = convertToSeconds(bufferedEndTime);
    this.handler.handleBufferedEndTimeChanged(bufferedEndTimeInSeconds);

    // 检查缓存状态。
    // 如果缓存状态发生了变化，则向 ArkWeb 内核通知缓存状态。
    let lastReadyState: webview.ReadyState = getLastReadyState();
    let currentReadyState:  webview.ReadyState = getCurrentReadyState();
    if (lastReadyState != currentReadyState) {
      this.handler.handleReadyStateChanged(currentReadyState);
    }
  }
  onEnterFullscreen() {
    // 本地播放器进入了全屏状态。
    let isFullscreen: boolean = true;
    this.handler.handleFullscreenChanged(isFullscreen);
  }
  onExitFullscreen() {
    // 本地播放器退出了全屏状态。
    let isFullscreen: boolean = false;
    this.handler.handleFullscreenChanged(isFullscreen);
  }
  onUpdateVideoSize(width: number, height: number) {
    // 当本地播放器解析出视频宽高时， 通知 ArkWeb 内核。
    this.handler.handleVideoSizeChanged(width, height);
  }
  onDurationChanged(duration: number) {
    // 本地播放器解析到了新的媒体时长， 通知 ArkWeb 内核。
    this.handler.handleDurationChanged(duration);
  }
  onError(error: webview.MediaError, errorMessage: string) {
    // 本地播放器出错了，通知 ArkWeb 内核。
    this.handler.handleError(error, errorMessage);
  }
  onNetworkStateChanged(state: webview.NetworkState) {
    // 本地播放器的网络状态发生了变化， 通知 ArkWeb 内核。
    this.handler.handleNetworkStateChanged(state);
  }
  onPlaybackRateChanged(playbackRate: number) {
    // 本地播放器的播放速率发生了变化， 通知 ArkWeb 内核。
    this.handler.handlePlaybackRateChanged(playbackRate);
  }
  onMutedChanged(muted: boolean) {
    // 本地播放器的静音状态发生了变化， 通知 ArkWeb 内核。
    this.handler.handleMutedChanged(muted);
  }

  // ... 监听本地播放器其他的状态 ...
}

class NativeMediaPlayerImpl implements webview.NativeMediaPlayerBridge {
  constructor(handler: webview.NativeMediaPlayerHandler, mediaInfo: webview.MediaInfo) {
    // 1. 创建一个本地播放器的状态监听。
    let listener: ActualNativeMediaPlayerListener = new ActualNativeMediaPlayerListener(handler);
    // 2. 创建一个本地播放器。
    // 3. 监听该本地播放器。
    // ...
  }

  updateRect: webview.UpdateRectFn = (x: double, y: double, width: double, height: double) : void=> {
    // <video> 标签的位置和大小发生了变化。
    // 根据该信息变化，作出相应的改变。
  }

  play: webview.ZeroParamFn = () : void=> {
    // 启动本地播放器播放。
  }

  pause: webview.ZeroParamFn = () : void=> {
    // 暂停本地播放器播放。
  }

  seek: webview.OneParamFn<double> = (targetTime: double) : void=> {
    // 本地播放器跳转到指定的时间点。
  }

  release: webview.ZeroParamFn = () : void=> {
    // 销毁本地播放器。
  }

  setVolume: webview.OneParamFn<double> = (volume: double) : void=> {
    // ArkWeb 内核要求调整本地播放器的音量。
    // 设置本地播放器的音量。
  }

  setMuted: webview.OneParamFn<boolean> = (muted: boolean) : void=> {
    // 将本地播放器静音或取消静音。
  }

  setPlaybackRate: webview.OneParamFn<double> = (playbackRate: double) : void=> {
    // 调整本地播放器的播放速度。
  }

  enterFullscreen: webview.ZeroParamFn = () : void=> {
    // 将本地播放器设置为全屏播放。
  }

  exitFullscreen: webview.ZeroParamFn = () : void=> {
    // 将本地播放器退出全屏播放。
  }

  resumePlayer?: webview.ResumePlayerFn = () : void=> {
    // 重新创建应用内播放器。
    // 恢复应用内播放器的状态信息。
  }

  suspendPlayer?: webview.SuspendPlayerFn = (type: webview.SuspendType) : void=> {
    // 记录应用内播放器的状态信息。
    // 销毁应用内播放器。
  }
}

@Entry
@Component
struct WebViewControllerVideoMedia {
  @State nativePlayer: webview.NativeMediaPlayerBridge | null = null;
  stringObj: StringFields  = new StringFields();
  @State userAgentPC:string = "";
  controller: webview.WebviewController = new webview.WebviewController();
  @State RectWidth:number = 0;
  @State RectHeight:number = 0;
  @State RectX:number = 0;
  @State RectY:number = 0;
  @State embedID:string = '';
  @State mediaType:number = 0;
  @State controlsShown:boolean = false;
  @State controlListLength:number = 0;
  @State muted:boolean = true;
  @State posterUrl:string ='';
  @State headersLength:number = 0;
  @State attributesLength:number = 0;
  @State type:number = 0;
  @State format:string = '';

  aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data != null && data['ACTION'] != null) {
        let strValue: string = String(data['ACTION']);
        this.stringObj.str = strValue;
        console.info(this.stringObj.str)
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebViewSurfaceInfo").id('surfaceInfoButton').onClick((e:ClickEvent) => {
          console.info("key==>" + this.stringObj.str)
          switch (this.stringObj.str) {
            case "rectEvent0100": {
              Utils.emitEvent(this.RectX, 202503222)
              break;
            }
            case "rectEvent0200": {
              Utils.emitEvent(this.RectY, 202503223)
              break;
            }
            case "rectEvent0300": {
              Utils.emitEvent(this.RectWidth, 202503224)
              break;
            }
            case "rectEvent0400": {
              Utils.emitEvent(this.RectHeight, 202503225)
              break;
            }
            case "MediaInfo0100": {
              Utils.emitEvent(this.embedID, 202503226)
              break;
            }
            case "MediaInfo0200": {
              Utils.emitEvent(this.mediaType, 202503227)
              break;
            }
            case "MediaInfo0300": {
              Utils.emitEvent(this.controlsShown, 202503228)
              break;
            }
            case "MediaInfo0400": {
              Utils.emitEvent(this.controlListLength, 202503229)
              break;
            }
            case "MediaInfo0500": {
              Utils.emitEvent(this.muted, 202503230)
              break;
            }
            case "MediaInfo0600": {
              Utils.emitEvent(this.posterUrl, 202503231)
              break;
            }
            case "MediaInfo0700": {
              Utils.emitEvent(this.headersLength, 202503232)
              break;
            }
            case "MediaInfo0800": {
              Utils.emitEvent(this.attributesLength, 202503233)
              break;
            }
            case "MediaInfo0900": {
              this.muted = true;
              Utils.emitEvent(this.muted, 202503234)
              break;
            }
            case "MediaInfo1000": {
              this.controlsShown = false;
              Utils.emitEvent(this.controlsShown, 202503235)
              break;
            }
            case "MediaSourceInfo0100": {
              Utils.emitEvent(this.type, 202503236)
              break;
            }
            case "MediaSourceInfo0200": {
              Utils.emitEvent(this.format, 202503237)
              break;
            }
          }
        })
      }



      Web({ src: $rawfile('scrollByTo.html'), controller: this.controller })
        .enableNativeMediaPlayer({enable: true, shouldOverlay: false})
        .onPageBegin((event) => {
          this.controller.onCreateNativeMediaPlayer((handler: webview.NativeMediaPlayerHandler, mediaInfo: webview.MediaInfo) => {
            this.RectWidth = mediaInfo.surfaceInfo.rect.width;
            this.RectHeight = mediaInfo.surfaceInfo.rect.height;
            console.log("mediaInfo: " + JSON.stringify(mediaInfo))
            console.log(`surfaceInfo.rect.x = ${mediaInfo.surfaceInfo.rect.x}`)
            console.log(`surfaceInfo.rect.y = ${mediaInfo.surfaceInfo.rect.y}`)
            console.log(`surfaceInfo.rect.width = ${mediaInfo.surfaceInfo.rect.width}`)
            console.log(`surfaceInfo.rect.height = ${mediaInfo.surfaceInfo.rect.height}`)
            this.RectX= mediaInfo.surfaceInfo.rect.x
            this.RectY = mediaInfo.surfaceInfo.rect.y
            this.RectWidth = mediaInfo.surfaceInfo.rect.width
            this.RectHeight = mediaInfo.surfaceInfo.rect.height
            this.embedID = mediaInfo.embedID
            this.muted = mediaInfo.muted
            this.mediaType = mediaInfo.mediaType
            this.controlsShown = mediaInfo.controlsShown
            this.posterUrl = mediaInfo.posterUrl
            this.controlListLength = JSON.stringify(mediaInfo.controlList).length
            this.headersLength = JSON.stringify(mediaInfo.headers).length
            this.attributesLength = JSON.stringify(mediaInfo.attributes).length
            let mediaSrcList = mediaInfo.mediaSrcList
            if(mediaSrcList){
              console.log("mediaSrcList: "+JSON.stringify(mediaSrcList))
              this.type = mediaSrcList[0].type
              this.format = mediaSrcList[0].format
            }
            let nativePlayer: webview.NativeMediaPlayerBridge = new NativeMediaPlayerImpl(handler, mediaInfo);
            return nativePlayer;
          });
        })
    }
  }
}


// stub
function getVolume() {
  return 1;
}
function getCurrentPlayingTime() {
  return 1;
}
function getCurrentBufferedTime() {
  return 1;
}
function convertToSeconds(input: number) {
  return input;
}
function getLastReadyState() {
  return webview.ReadyState.HAVE_NOTHING;
}
function getCurrentReadyState() {
  return webview.ReadyState.HAVE_NOTHING;
}
function shouldHandle(mediaInfo: webview.MediaInfo) {
  return true;
}
