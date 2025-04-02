/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
import router from '@ohos.router';

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
    onError() : void
    onVideoSizeChanged(width: number, height: number) : void
    onDestroyed() : void
}

interface PlayerParam {
    url: string,
    listener?: AVPlayerListener
}

interface PlayCommand {
    func: Function;
    name?: string;
}

interface CheckPlayCommandResult{
    ignore: boolean;
    index_to_remove: number;
}

class AVPlayerDemo {
    private surfaceID: string = ''; // surfaceID用于播放画面展示，具体的值需要通过Xcomponent接口获取，相关文档链接见上面Xcomponent创建方法
    private isSeek: boolean = true; // 用于区分模式是否支持seek操作
    private fileSize: number = -1;
    private fd: number = 0;
    private listener?: AVPlayerListener
    avPlayer?: media.AVPlayer;
        
    prepared: boolean = false;
    
    commands: PlayCommand[];
    
    constructor() {
        this.commands = [];
    }
    
    setSurfaceID(surface_id: string) {
        console.log('setSurfaceID : ' + surface_id)
        this.surfaceID = surface_id;
    }
    // 注册avplayer回调函数
    setAVPlayerCallback(avPlayer: media.AVPlayer, listener?: AVPlayerListener) {
        this.listener = listener
        // seek操作结果回调函数
        avPlayer.on('seekDone', (seekDoneTime: number) => {
            listener?.onSeekFinished(seekDoneTime)
            console.info('AVPlayer seek succeeded, seek time is ${seekDoneTime}');
        })
        // error回调监听函数，当avPlayer在操作过程中出现错误时调用reset接口触发重置流程
        avPlayer.on('error', (err: BusinessError) => {
            console.error('[BrowserShell] Invoke avPlayer failed, code is ${err.code}, message is ${err.message}');
            listener?.onError();
            avPlayer.reset(); // 调用reset重置资源，触发idle状态
        })
        // volumeChange
        avPlayer.on('volumeChange', (vol:number) => {
            console.info('volumeChange success,and new volume is :' + vol)
            listener?.onVolume && listener.onVolume(vol);
        })
        // speed change
        avPlayer.on('speedDone', (speed:number) => {
            console.info('speedDone success,and speed value is :' + speed)
            listener?.onPlaybackRateChanged && listener.onPlaybackRateChanged(speed);
        })
        // 状态机变化回调函数
        avPlayer.on('stateChange', async (state: string, reason: media.StateChangeReason) => {
            switch (state) {
                case 'idle': // 成功调用reset接口后触发该状态机上报
                    console.info('AVPlayer state idle called.');
                    avPlayer.release(); // 调用release接口销毁实例对象
                    break;
                case 'initialized': // avplayer 设置播放源后触发该状态上报
                    console.info('AVPlayer state initialized called. surfaceID[${this.surfaceID}]');
                    avPlayer.surfaceId = this.surfaceID; // 设置显示画面，当播放的资源为纯音频时无需设置
                    avPlayer.prepare();
                    console.info('AVPlayer state after call prepare().');
                    break;
                case 'prepared': // prepare调用成功后上报该状态机
                    console.info('AVPlayer state prepared called.');
                    this.prepared = true;
                    this.schedule();
                    break;
                case 'playing': // play成功调用后触发该状态机上报
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
                    this.prepared = false;
                    listener?.onDestroyed();
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
    async avPlayerLiveDemo(playerParam: PlayerParam) {
        // 创建avPlayer实例对象
        this.avPlayer = await media.createAVPlayer();
        // 创建状态机变化回调函数
        this.setAVPlayerCallback(this.avPlayer, playerParam.listener);
        this.isSeek = false; // 不支持seek操作
        this.avPlayer.url = playerParam.url;
        console.log('AVPlayer url:[${playerParam.url}]');
    }
    
    async avPlayerFdSrcDemo(playerParam: PlayerParam) {
        // 创建avPlayer实例对象
        this.avPlayer = await media.createAVPlayer();
        // 创建状态机变化回调函数
        this.setAVPlayerCallback(this.avPlayer, playerParam.listener);
        let context = getContext(this) as common.UIAbilityContext;
        let fileDescriptor = await context.resourceManager.getRawFd('blender_short.mp4');
        let avFileDescriptor:media.AVFileDescriptor = 
            { fd: fileDescriptor.fd, offset: fileDescriptor.offset, length: fileDescriptor.length };
        this.isSeek = true; // 支持seek操作
        // 为fdSrc赋值出发initialized状态机上报
        this.avPlayer.fdSrc = avFileDescriptor;
    }
    
    schedule() {
        if (!this.avPlayer) {
            return;
        }
        if (!this.prepared) {
            return;
        }
        if (this.commands.length > 0) {
            let command = this.commands.shift();
            if (command) {
                command.func();
            }
            if (this.commands.length > 0) {
                setTimeout(() => {
                    this.schedule();
                });
            }
        }
    }
    
    private checkCommand(selfName: string, oppositeName: string) {
        let index_to_remove = -1;
        let ignore_this_action = false;
        let index = this.commands.length - 1;
        while (index >= 0) {
            if (this.commands[index].name == selfName) {
                ignore_this_action = true;
                break;
            }
            if (this.commands[index].name == oppositeName) {
                index_to_remove = index;
                break;
            }
            index--;
        }
        
        let result : CheckPlayCommandResult = {
            ignore: ignore_this_action,
            index_to_remove: index_to_remove,
        };
        return result;
    }
    play() {
        let commandName = 'play';
        let checkResult = this.checkCommand(commandName, 'pause');
        if (checkResult.ignore) {
            console.log('AVPlayer ${commandName} ignored.');
            this.schedule();
            return;
        }
        if (checkResult.index_to_remove >= 0) {
            let removedCommand = this.commands.splice(checkResult.index_to_remove, 1);
            console.log('AVPlayer ${JSON.stringify(removedCommand)} removed.');
            return;
        }
        this.commands.push({ func: ()=>{
            console.info('AVPlayer.play()');
            this.avPlayer?.play();
        },name: commandName});
        this.schedule();
    }
    pause() {
        let commandName = 'pause';
        let checkResult = this.checkCommand(commandName, 'play');
        console.log('checkResult: ${JSON.stringify(checkResult)}');
        if (checkResult.ignore) {
            console.log('AVPlayer ${commandName} ignored.');
            this.schedule();
            return;
        }
        if (checkResult.index_to_remove >= 0) {
            let removedCommand = this.commands.splice(checkResult.index_to_remove, 1);
            console.log('AVPlayer ${JSON.stringify(removedCommand)} removed.');
            return;
        }
        this.commands.push({ func: ()=>{
            console.info('AVPlayer.pause()');
            this.avPlayer?.pause();
        },name: commandName});
        this.schedule();
    }
    release() {
        this.commands.push({ func: ()=>{
            console.info('AVPlayer.release()');
            this.avPlayer?.release();
        }});
        this.schedule();
    }
    seek(time: number) {
        this.commands.push({ func: ()=>{
            console.info('AVPlayer.seek log (' + time + ')');
            this.listener?.onSeeking();
            this.avPlayer?.seek(time * 1000);
        }});
        this.schedule();
    }
    setVolume(volume: number) {
        this.commands.push({ func: ()=>{
            console.info('AVPlayer.setVolume(' + volume + ')');
            this.avPlayer?.setVolume(volume);
        }});
        this.schedule();
    }
    setPlaybackRate(playbackRate: number) {
        let speed = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
        let delta = 0.05;
        playbackRate += delta;
        if (playbackRate < 1) {
            speed = media.PlaybackSpeed.SPEED_FORWARD_0_75_X;
        } else if (playbackRate < 1.25) {
            speed = media.PlaybackSpeed.SPEED_FORWARD_1_00_X;
        } else if (playbackRate < 1.5) {
            speed = media.PlaybackSpeed.SPEED_FORWARD_1_25_X;
        } else if (playbackRate < 2) {
            speed = media.PlaybackSpeed.SPEED_FORWARD_1_75_X;
        } else {
            speed = media.PlaybackSpeed.SPEED_FORWARD_2_00_X;
        }
        this.commands.push({ func: ()=>{
            console.info('AVPlayer.setSpeed(' + speed + ')');
            this.avPlayer?.setSpeed(speed);
        }});
        this.schedule();
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
        console.log("handle PlaybackStatus:")
        Utils.emitEvent(true, 1312)
        this.rawHandler.handleStatusChanged(status)
    }
    
    handleVolumeChanged(volume: number): void {
        console.log("handle volume change :" + volume)
        if(volume == 0.5) {
            Utils.emitEvent(true, 1307)
        }
        this.rawHandler.handleVolumeChanged(volume)
    }
    
    handleMutedChanged(muted: boolean): void {
        console.log("handle muted:" + muted)
        Utils.emitEvent(true, 1316)
        this.rawHandler.handleMutedChanged(muted)
    }
    
    handlePlaybackRateChanged(playbackRate: number): void {
        console.log("handle playbackRate:" + playbackRate)
        if(playbackRate == media.PlaybackSpeed.SPEED_FORWARD_2_00_X) {
            Utils.emitEvent(true, 1304)
        }
        this.rawHandler.handlePlaybackRateChanged(playbackRate)
    }
    
    handleDurationChanged(duration: number): void {
        console.log("handle duration :" + duration)
        Utils.emitEvent(true, 1302)
        this.rawHandler.handleDurationChanged(duration)
    }
    
    handleTimeUpdate(currentPlayTime: number): void {
        console.log("handle currentPlayTime :" + currentPlayTime)
        Utils.emitEvent(true, 1300)
        this.rawHandler.handleTimeUpdate(currentPlayTime)
    }
    
    handleBufferedEndTimeChanged(bufferedEndTime: number): void {
        console.log("handle bufferedEndTime :" + bufferedEndTime)
        Utils.emitEvent(true, 1301)
        this.rawHandler.handleBufferedEndTimeChanged(bufferedEndTime)
    }
           
    handleEnded(): void {
        console.log("handle end:")
        Utils.emitEvent(true, 1308)
        this.rawHandler.handleEnded()
    }
    
    handleNetworkStateChanged(state: webview.NetworkState): void {
        console.log("handleNetworkStateChanged before:" + state)
        Utils.emitEvent(true, 1315)
        console.log("handleNetworkStateChanged dfdf:" + state)
        this.rawHandler.handleNetworkStateChanged(state)
    }
    
    handleReadyStateChanged(state: webview.ReadyState): void {
        console.log("handleReadyStateChanged :" + state)
        Utils.emitEvent(true, 1310)
        this.rawHandler.handleReadyStateChanged(state)
    }
    
    handleFullscreenChanged(fullscreen: boolean): void {
        console.log("handle fullscreen :" + fullscreen)
        this.rawHandler.handleFullscreenChanged(fullscreen)
    }
    
    handleSeeking(): void {
        console.log("handleSeeking:")
        Utils.emitEvent(true, 1305)
        this.rawHandler.handleSeeking()
    }
    
    handleSeekFinished(): void {
        console.log("handleSeekFinished:")
        Utils.emitEvent(true, 1306)
        this.rawHandler.handleSeekFinished()
    }
    
    handleError(error: webview.MediaError, errorMessage: string): void {
        console.log("handleError:" + "mediaError" + errorMessage + ":" + errorMessage)
        Utils.emitEvent(true, 1309)
        this.rawHandler.handleError(error,errorMessage)
    }
    
    handleVideoSizeChanged(width: number, height: number): void {
        console.log("handleVideoSizeChanged:")
        Utils.emitEvent(true, 1303)
        this.rawHandler.handleVideoSizeChanged(width,height)
    }
}
class NativeMediaPlayerImpl implements webview.NativeMediaPlayerBridge{
    private surfaceId: string;
    mediaSource: string;
    private mediaHandler: webview.NativeMediaPlayerHandler;
    web: WebComponent;
    nativePlayer: AVPlayerDemo;
    playerActions: Function[] = [];
    
    constructor(web: WebComponent, handler: webview.NativeMediaPlayerHandler, videoInfo: webview.MediaInfo) {
        console.log('NativeMediaPlayerImpl.constructor, surface_id[' + videoInfo.surfaceInfo.id + ']');
        this.web = web;
        this.mediaHandler = handler;
        this.surfaceId = videoInfo.surfaceInfo.id;
        this.mediaSource = videoInfo.mediaSrcList[0].source;
        for (let mediaSrcItem of videoInfo.mediaSrcList) {
            if (mediaSrcItem.source.indexOf('.mp4') > 0) {
                this.mediaSource = mediaSrcItem.source;
                break;
            }
        }
        
        this.nativePlayer = new AVPlayerDemo();
        
        this.web.node_controller = new MyNodeController(
            this.web, this.surfaceId, this.mediaHandler, this, NodeRenderType.RENDER_TYPE_TEXTURE)
        this.web.node_controller.rebuild()
        this.web.show_native_media_player = true;
        
        console.log('NativeMediaPlayerImpl.mediaSource : ' + this.mediaSource);
    }
    
    updateRect(x: number, y: number, width: number, height: number): void {
        let width_in_vp = px2vp(width);
        let height_in_vp = px2vp(height);
        
        this.web.node_offset.x = px2vp(x);
        this.web.node_offset.y = px2vp(y);
        this.web.node_width = px2vp(width);
        this.web.node_height = px2vp(height);
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
        if (targetTime == 50) {
            Utils.emitEvent(true, 1293)
        }
        this.nativePlayer?.seek(targetTime);
    }
    setVolume(volume: number) {
        console.log('[BrowserShell] ===gpz=== MediaPlayer.setVolume(' + volume + ')');
        if (volume == 0.5) {
            Utils.emitEvent(true, 1290)
        }
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
        this.nativePlayer?.setPlaybackRate(playbackRate);
    }
    release() {
        console.log('[BrowserShell] ===gpz=== MediaPlayer.release');
        shouldWaitForLastAVPlayerDestroyed = true;
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
        console.log('[BrowserShell] end onPlaying');
    }
    onPaused() {
        console.log('[BrowserShell] onPaused, handler[' + this.handler + ']')
        this.handler.handleStatusChanged(webview.PlaybackStatus.PAUSED);
        console.log('[BrowserShell] end onPaused');
    }
    onSeeking() {
        console.log('[BrowserShell] onSeeking, handler[' + this.handler + ']')
        this.handler.handleSeeking();
    }
    onSeekFinished() {
        console.log('[BrowserShell] onSeekFinished, handler[' + this.handler + ']')
        this.handler.handleSeekFinished();
    }
    onDurationChanged(duration: number) {
        console.log('[BrowserShell] onDurationChanged(' + duration + '), handler[' + this.handler + ']')
        this.handler.handleDurationChanged(duration);
        console.log('[BrowserShell] onNetworkStateChanged(' + webview.NetworkState.toString() + '), handler[' + this.handler + ']')
        this.handler.handleNetworkStateChanged(webview.NetworkState.LOADING);
    }
    onPlaybackRateChanged(speed: number) {
        console.log('[BrowserShell] onPlaybackRateChanged(' + speed + '), handler[' + this.handler + ']')
        this.handler.handlePlaybackRateChanged(speed);
    }
    onVolume(vol: number): void {
        console.log('[BrowserShell] onVolume(' + vol + '), handler[' + this.handler + ']')
        this.handler.handleVolumeChanged(vol);
        if(vol == 0) {
            this.handler.handleMutedChanged(true)
        } else {
            this.handler.handleMutedChanged(false)
        }
    }
    onBufferedTimeChanged(buffered: number) {
        console.log('[BrowserShell] onBufferedTimeChanged(' + buffered + '), handler[' + this.handler + ']')
        this.handler.handleBufferedEndTimeChanged(buffered);
    }
    onTimeUpdate(time: number) {
        console.log('[BrowserShell] onTimeUpdate(' + time + '), handler[' + this.handler + ']')
        this.handler.handleTimeUpdate(time);
    }
    onEnded() {
        console.log('[BrowserShell] onEnded(), handler[' + this.handler + ']')
        this.handler.handleEnded();
    }
    onError() {
        console.log('[BrowserShell] onError(), handler[' + this.handler + ']')
        this.handler.handleError(2, "Oops!");
    }
    onVideoSizeChanged(width: number, height: number) {
        console.log('[BrowserShell] onVideoSizeChanged(' + width + ',' + height + '), handler[' + this.handler + ']')
        this.handler.handleVideoSizeChanged(width, height);
        this.component.onSizeChanged(width, height);
    }
    onDestroyed() {
        shouldWaitForLastAVPlayerDestroyed = false;
        triggerActions();
    }
}

interface ComponentParams {
    text: string
    text2: string
    web_tab: WebComponent
    handler: webview.NativeMediaPlayerHandler
    player: NativeMediaPlayerImpl
    shouldOverlay: boolean
}

let shouldWaitForLastAVPlayerDestroyed: boolean = false;
let actionsWaitForLastAVPlayerDestroyed: Function[] = [];
function waitForLastAVPlayerDestroyed(action: Function) {
    if (!shouldWaitForLastAVPlayerDestroyed) {
        action();
        return;
    }
    actionsWaitForLastAVPlayerDestroyed.push(action);
}
function triggerActions() {
    while (actionsWaitForLastAVPlayerDestroyed.length > 0) {
        let action = actionsWaitForLastAVPlayerDestroyed.shift();
        if (action) {
            action();
        }
    }
}  
 
@Component
struct MyComponent {
    params?: ComponentParams
    @State bkColor: Color = Color.Red
    mXComponentController: XComponentController = new XComponentController();
    @State player_changed: boolean = false;
    
    videoController: VideoController = new VideoController();
    offset_x: number = 0
    offset_y: number = 0
    @State video_width_percent: number = 100;
    @State video_height_percent: number = 100;
    view_width: number = 0;
    view_height: number = 0;
    video_width: number = 0;
    video_height: number = 0;
    
    fullscreen: boolean = false;
    
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
                      this.params.player.nativePlayer.setSurfaceID(this.mXComponentController.getXComponentSurfaceId());
                      this.player_changed = !this.player_changed;
                      
                      waitForLastAVPlayerDestroyed(() => {
                          console.log('[BrowserShell] will avPlayerLiveDemo');
                          this.params?.player.nativePlayer.avPlayerLiveDemo({
                              url: this.params.player.mediaSource,
                              listener: new AVPlayerListenerImpl(this.params.handler, this)
                          });
                      });
                  })
                  
                if (this.params?.shouldOverlay) {
                    Column() {
                        Row() {
                            Button(this.params?.text)
                              .height(50)
                              .border({ width: 2, color: Color.Red })
                              .backgroundColor(this.bkColor)
                              .onClick(() => {
                                console.log('[BrowserShell] Button[' + this.params?.text + '] is clicked');
                                this.params?.player.nativePlayer?.play();
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
                                this.params?.player.nativePlayer?.pause();
                              })
                              .onTouch((event: TouchEvent) => {
                                  event.stopPropagation();
                              })
                        }
                        .width('100%')
                        .layoutWeight(1)
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
                        .height(0)
                        .layoutWeight(0)
                        .justifyContent(FlexAlign.SpaceBetween)
                        
                        Row() {
                            Button("ToggleFullScreen")
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
                        .layoutWeight(1)
                        .justifyContent(FlexAlign.End)
                    }
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

@Builder
function ButtonBuilder(params: ComponentParams) {
    MyComponent({ params: params })
        .backgroundColor(Color.Green)
        .border({ width: 1, color: Color.Brown })
        .width('100%')
        .height('100%')
}

class MyNodeController extends NodeController {
    private rootNode: BuilderNode<[ComponentParams]> | undefined;
    private isRemove = false;
    web_tab: WebComponent
    listener: webview.NativeMediaPlayerHandler
    player: NativeMediaPlayerImpl
    private surfaceId_: string;
    private renderType_: NodeRenderType
        
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
        let params: ComponentParams = {
            "text": "play",
            "text2": "pause",
            web_tab: this.web_tab,
            handler: this.listener,
            player: this.player,
            shouldOverlay: this.web_tab.pageParams.shouldOverlay,
        };
        if (this.rootNode) {
            this.rootNode.build(wrapBuilder(ButtonBuilder), params);
        }
    }
    
    postTouchEvent(event: TouchEvent) {
        return this.rootNode?.postTouchEvent(event);
    }
}

interface PageBeginParam {
    url: string
}

interface PageParams {
    shouldOverlay: boolean;
    componentOverlay?: boolean;
}
  
@Entry
@Component
struct WebComponent {
  controller: WebviewController = new webview.WebviewController();
  nativePlayer? : webview.NativeMediaPlayerBridge
  page_url: Resource = $rawfile('nativeMediaPlayerHandler.html')
  node_controller?: MyNodeController
  @State show_native_media_player: boolean = false;
  @State node_width : number = 30;
  @State node_height : number = 15;
  @State node_offset : Position = {x: 0, y: 0};
  
  area?: Area
  pageParams: PageParams = {
      shouldOverlay: true,
      componentOverlay: false
  }
  @State emitKey: string = "emitWebViewNativeMediaPlayerHandleTimeUpdate";
  
  onPageShow() {
      let valueChangeEvent: events_emitter.InnerEvent = {
          eventId: 10,
          priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }
  
  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
      if (eventData != null) {
          console.info("valueChangeCallBack:" + JSON.stringify(eventData));
          if (eventData.data != null && eventData.data.ACTION != null) {
              this.emitKey = eventData.data.ACTION;
          }
      }
  }
  build() {
      Column() {
          Row() {
              Button("web click").key('webViewNativeMediaPlayerHandler').onClick(async () => {
                  console.info("key==>" + this.emitKey)
                  this.controller.refresh()
                await Utils.sleep(1000)
                this.controller.runJavaScript("buttonPlay()", (error, result) => {
                    console.error('The play() return error is: ${error}');
                    console.log('The play() return value is: ${result}');
                })
                switch (this.emitKey) {
                    case "emitWebViewNativeMediaPlayerHandleTimeUpdate": {
                        try {
                            console.log('emitWebViewNativeMediaPlayerHandleTimeUpdate==>')
                            await Utils.sleep(1000)
                            this.controller.runJavaScript("setSeek()", (error, result) => {
                                console.log('The playerHandleTimeUpdate() return value is: ${result}');
                            })
                            await Utils.sleep(1500)
                            Utils.emitEvent(true,1300)
                        } catch (error) {
                            Utils.emitEvent('error',1300)
                        }
                        break;
                    }
                    case "emitWebViewNativeMediaPlayerHandleBufferedEndTimeChanged": {
                        try {
                            console.log('emitWebViewNativeMediaPlayerHandleBufferedEndTimeChanged==>')
                            await Utils.sleep(1000)
                            this.controller.runJavaScript("setSeek()", (error, result) => {
                                console.log('The playerHandleTimeUpdate() return value is: ${result}');
                            })
                            await Utils.sleep(1500)
                            Utils.emitEvent(true,1301)
                        } catch (error) {
                            Utils.emitEvent('error',1301)
                        }
                        break;
                    }
                  case "emitWebViewNativeMediaPlayerHandleDurationChanged": {
                     try {
                        console.log('emitWebViewNativeMediaPlayerHandleDurationChanged==>')
                        await Utils.sleep(1500)
                        Utils.emitEvent(true,1302)
                     } catch (error) {
                        Utils.emitEvent('error',1302)
                     }
                    break;
                  }
                    case "emitWebViewNativeMediaPlayerHandleVideoSizeChanged": {
                        try {
                            console.log('emitWebViewNativeMediaPlayerHandleVideoSizeChanged==>')
                            await Utils.sleep(1000)
                            this.controller.runJavaScript("resize()", (error, result) => {
                                console.log('The resize() return value is: ${result}');
                            })
                            await Utils.sleep(1500)
                            Utils.emitEvent(true,1303)
                        } catch (error) {
                            Utils.emitEvent('error',1303)
                        }
                        break;
                    }
                    case "emitWebViewNativeMediaPlayerHandlePlaybackRateChanged": {
                        try {
                            console.log('emitWebViewNativeMediaPlayerHandlePlaybackRateChanged==>')
                            await Utils.sleep(1000)
                            this.controller.runJavaScript("setPlayBackRate()", (error, result) => {
                                console.log('The setPlayBackRate() return value is: ${result}');
                            })
                            await Utils.sleep(2000)
                            Utils.emitEvent(true,1304)
                        } catch (error) {
                            Utils.emitEvent('error',1304)
                        }
                        break;
                    }
                    case "emitWebViewNativeMediaPlayerHandleSeeking": {
                        try {
                            console.log('emitWebViewNativeMediaPlayerHandleSeeking==>')
                            await Utils.sleep(1000)
                            this.controller.runJavaScript("setSeek()", (error, result) => {
                                console.log('The playerHandleTimeUpdate() return value is: ${result}');
                            })
                            await Utils.sleep(1500)
                            Utils.emitEvent(true,1305)
                        } catch (error) {
                            Utils.emitEvent('error',1305)
                        }
                        break;
                    }
                    case "emitWebViewNativeMediaPlayerHandleSeekFinished": {
                        try {
                            console.log('emitWebViewNativeMediaPlayerHandleSeekFinished==>')
                            await Utils.sleep(1000)
                            this.controller.runJavaScript("setSeek()", (error, result) => {
                                console.log('The playerHandleTimeUpdate() return value is: ${result}');
                            })
                            await Utils.sleep(1000)
                            Utils.emitEvent(true,1306)
                        } catch (error) {
                            Utils.emitEvent('error',1306)
                        }
                        break;
                    }
                    case "emitWebViewNativeMediaPlayerHandleVolumeChanged": {
                        try {
                            console.log('emitWebViewNativeMediaPlayerHandleVolumeChanged==>')
                            await Utils.sleep(1000)
                            this.controller.runJavaScript("setVolume()", (error, result) => {
                                console.log('The setVolume() return value is: ${result}');
                            })
                            await Utils.sleep(2000)
                            Utils.emitEvent(true,1307)
                        } catch (error) {
                            Utils.emitEvent('error',1307)
                        }
                        break;
                    }
                    case "emitWebViewNativeMediaPlayerHandleEnded": {
                        try {
                            console.log('emitWebViewNativeMediaPlayerHandleEnded==>')
                            await Utils.sleep(1000)
                            this.controller.runJavaScript("jumpToEnd()", (error, result) => {
                                console.log('The jumpToEnd() return value is: ${result}');
                            })
                            await Utils.sleep(2000)
                            Utils.emitEvent(true,1308)
                        } catch (error) {
                            Utils.emitEvent('error',1308)
                        }
                        break;
                    }
                    case "emitWebViewNativeMediaPlayerHandleError": {
                        try {
                            this.controller.loadUrl($rawfile("nativeMediaError.html"))
                            await Utils.sleep(1500)
                            Utils.emitEvent(true,1309)
                        } catch (error) {
                            Utils.emitEvent('error',1309)
                        }
                        break;
                    }
                    case "emitWebViewNativeMediaPlayerHandleStatusChanged": {
                        try {
                            console.log('emitWebViewNativeMediaPlayerHandleStatusChanged==>')
                            this.controller.runJavaScript("buttonPause()", (error, result) => {
                                console.log('The pause() return value is: ${result}');
                            })
                            await Utils.sleep(1000)
                            this.controller.runJavaScript("buttonPlay()", (error, result) => {
                                console.log('The pause() return value is: ${result}');
                            })
                            await Utils.sleep(1500)
                            Utils.emitEvent(true,1312)
                        } catch (error) {
                            Utils.emitEvent('error',1312)
                        }
                        break;
                    }
                    case "emitWebViewNativeMediaPlayerHandleMutedChanged": {
                        try {
                            console.log('emitWebViewNativeMediaPlayerHandleMutedChanged==>')
                            await Utils.sleep(1000)
                            this.controller.runJavaScript("buttonPlay()", (error, result) => {
                                console.log('The pause() return value is: ${result}');
                            })
                            await Utils.sleep(1000)
                            this.controller.runJavaScript("setMutedFalse()", (error, result) => {
                                console.log('The setMutedFalse() return value is: ${result}');
                            })
                            await Utils.sleep(1500)
                            Utils.emitEvent(true,1316)
                        } catch (error) {
                            Utils.emitEvent('error',1316)
                        }
                        break;
                    }
                    case "emitWebViewNativeVideoSetSeek": {
                        try {
                            console.log('emitWebViewNativeVideoSetSeek==>')
                            this.controller.loadUrl($rawfile('nativeMediaSetSeek.html'))
                            await Utils.sleep(1000)
                            this.controller.runJavaScript("buttonPlay()", (error, result) => {
                                console.error('The play(0 return error is: ${error}');
                                console.log('The play(0 return value is: ${result}');
                            })
                            await Utils.sleep(1000)
                            this.controller.runJavaScript("setSeek()", (error, result) => {
                                console.log('The setSeek(0 return value is: ${result}');
                            })
                            await Utils.sleep(2000)
                            Utils.emitEvent(true, 1293)
                        } catch (error) {
                            Utils.emitEvent('error',1293)
                        }
                        break;
                    }

                    case "emitWebViewNativeMediaSetVolume": {
                        try {
                            this.controller.loadUrl($rawfile('nativeMediaSetVolume.html'))
                            console.log('emitWebViewNativeMediaSetVolume==>')
                            await Utils.sleep(1000)
                            this.controller.runJavaScript("buttonPlay()", (error, result) => {
                                console.error('The play(0 return error is: ${error}');
                                console.log('The play(0 return value is: ${result}');
                            })
                            await Utils.sleep(1000)
                            this.controller.runJavaScript("setVolume()", (error, result) => {
                                console.log('The setVolume(0 return value is: ${result}');
                            })
                            await Utils.sleep(2000)
                            Utils.emitEvent(true, 1290)
                        } catch (error) {
                            Utils.emitEvent('error',1290)
                        }
                        break;
                    }
                    case "emitWebViewNativeMediaMediaInfo": {
                        try {
                            this.controller.loadUrl($rawfile('nativeMediaInfo.html'))
                            console.log('emitWebViewNativeMediaMediaInfo==>')
                            this.controller.runJavaScript("buttonLoad()", (error, result) => {
                                console.log('The load() return value is: ${result}');
                            })
                            await Utils.sleep(1000)
                            this.controller.runJavaScript("buttonPlay()", (error, result) => {
                                console.error('The play() return error is: ${error}');
                                console.log('The play() return value is: ${result}');
                            })
                            await Utils.sleep(2000)
                            Utils.emitEvent(true, 1289)
                        } catch (error) {
                            Utils.emitEvent('error',1289)
                        }
                        break;
                    }
                }
              })
          }
          Stack({alignContent:Alignment.TopStart}) {
              if (!this.pageParams.componentOverlay && this.show_native_media_player) {
                  NodeContainer(this.node_controller)
                      .width(this.node_width)
                      .height(this.node_height)
                      .offset(this.node_offset)
                      .backgroundColor(Color.Transparent)
                      .border({ width: 2, color: Color.Orange })
                      .onAreaChange((oldValue, newValue) => {
                          console.log('NodeContainer.onAreaChange([${oldValue.width} x ${oldValue.height}]->[${newValue.width} x ${newValue.height}]');
                      })
              }
              Web({ src: this.page_url, controller: this.controller })
                .enableNativeMediaPlayer({ enable: true, shouldOverlay: true })
                .onPageBegin((event: PageBeginParam) => {
                    console.error('enter onPageBegin, url:' + event.url);
                    console.error(' in onPageBegin, onCreateNativeMediaPlayer:' + this.controller.onCreateNativeMediaPlayer);
                    this.controller.onCreateNativeMediaPlayer((handler: webview.NativeMediaPlayerHandler, mediaInfo: webview.MediaInfo) => {
                        console.error('onCreateNativeMediaPlayer(' + JSON.stringify(mediaInfo) + ')');
                        let mediaInfoJson = JSON.parse(JSON.stringify(mediaInfo))
                        console.log("mediaInfoJSon" + JSON.stringify(mediaInfo))
                        let isEmbedId = mediaInfo.embedID && mediaInfo.embedID != ''
                        let isMediaType = JSON.has(mediaInfoJson,'mediaType') && (mediaInfo.mediaType == 0)
                        let isMediaSrcList = mediaInfo.mediaSrcList && mediaInfo.mediaSrcList.length ===2
                        let isSurfaceInfo = mediaInfo.surfaceInfo && !!mediaInfo.surfaceInfo.id && !!mediaInfo.surfaceInfo.rect
                        let isControlShown = mediaInfo.controlsShown && mediaInfo.controlsShown == true
                        let isControlList = mediaInfo.controlList && mediaInfo.controlList.length > 0
                        let isAttributesMap = mediaInfo.attributes && JSON.has(mediaInfoJson, 'attributes')
                        let isPredload = !!mediaInfo.preload
                        let isPosterUrl = mediaInfo.posterUrl && (mediaInfo.posterUrl != '')
                        let isMediaInfo = isEmbedId && isMediaType && isMediaSrcList && isSurfaceInfo && isControlShown && isAttributesMap && isPredload && isPosterUrl

                        console.error("isPosterUrl" + isPosterUrl)
                        console.error("isMediaInfo" + isMediaInfo)
                        console.error("isEmbedId" + isEmbedId)
                        console.error("isMediaType" + isMediaType)
                        console.error("isMediaSrcList" + isMediaSrcList)
                        console.error("isSurfaceInfo" + isSurfaceInfo)
                        console.error("isControlShown" + isControlShown)
                        console.error("isAttributesMap" + isAttributesMap)
                        console.error("isPosterUrl" + isPosterUrl)
                        console.error("isControlList" + isControlList)
                        console.error("isPredload" + isPredload)
                        if (this.emitKey == 'emitWebViewNativeMediaMediaInfo') {
                            Utils.emitEvent(isEmbedId, 1289)
                        }
                        this.nativePlayer = new NativeMediaPlayerImpl(this, new NativeMediaPlayerHandlerImpl(handler), mediaInfo);
                        return this.nativePlayer;
                    });
                    console.error('exit onPageBegin');
                })
                .width('100%')
                .height('100%')
                .onAreaChange((oldValue: Area, newValue: Area) => {
                    oldValue;
                    this.area = newValue;
                })
                .onNativeEmbedGestureEvent((event: NativeEmbedTouchInfo) => {
                    if (!event.touchEvent || !this.node_controller) {
                        return;
                    }
                    let ret = this.node_controller.postTouchEvent(event.touchEvent);
                    console.log('[BrowserShell] postTouchEvent, ret[${ret}], touchEvent[${JSON.stringify(event.touchEvent)}]');
                    event.result?.setGestureEventResult(true);
                })
            if (this.pageParams.componentOverlay && this.show_native_media_player) {
                NodeContainer(this.node_controller)
                    .width(this.node_width)
                    .height(this.node_height)
                    .offset(this.node_offset)
                    .backgroundColor(Color.Transparent)
                    .border({ width: 2, color: Color.Orange })
                    .onAreaChange((oldValue, newValue) => {
                        console.log('NodeContainer.onAreaChange([${oldValue.width} x ${oldValue.height}]->[${newValue.width} x ${newValue.height}]');
                    })
            }
          }
          .layoutWeight(1)
          .height('100%')
      }
      .justifyContent(FlexAlign.Start)
      .alignItems(HorizontalAlign.Center)
  }
  
  onBackPress(): boolean | void {
      router.back();
      return true;
  }
}
      
                    
   
