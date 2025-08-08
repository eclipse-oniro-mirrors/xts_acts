/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2020-2020. All rights reserved.
 */
/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
 
import { fileIo } from '@kit.CoreFileKit';
import { display, promptAction, router } from '@kit.ArkUI';
import { photoAccessHelper } from '@kit.MediaLibraryKit';
import player from 'libplayer.so';
import Logger from '../common/utils/Logger';
import { CommonConstants as Const } from '../common/CommonConstants';
import picker from '@ohos.file.picker'

const TAG: string = 'Sample_Player'
const PLAY_STATUS = ['initial', 'selected', 'prepared', 'ready', 'playing', 'pausing']


@Entry
@Component
export struct Player {
  @State duration:string = '--:--:--'
  @State progress:string = '--:--:--'
  @State progressBarNumber:number = 0;
  @State speedMode:number = 1.0;
  @State playStatus:string = 'initial';
  @State isPausing:boolean = false;
  @State xComponentStatus:Visibility = Visibility.Hidden;
  private intervalId:number = -1;
  private selectFilePath: string | null = null;
  private sourcePath: string[] = ['从文件管理选取', '从图库选取']
  private durationTime:number = 0;
  private progressTime:number = 0;
  private volume:number = 100;
  private touchX:number = -1;
  private seekMode:number = 1;

  selectFile() {
    TextPickerDialog.show({
      range: this.sourcePath,
      canLoop: false,
      selected: 0,
      onAccept: (value: TextPickerResult) => {
        switch (value.value) {
          case '从文件管理选取':
            this.selectDocFile()
            break
          case '从图库选取':
            this.selectAlbumFile()
            break
          default:
            this.selectAlbumFile()
            break
        }
      }
    })
  }

  selectDocFile() {
    let documentSelectOptions = new picker.DocumentSelectOptions
    let documentViewPicker = new picker.DocumentViewPicker
    documentViewPicker.select(documentSelectOptions)
      .then((documentSelectResult) => {
        this.selectFilePath = documentSelectResult[0]
        if (this.selectFilePath == null) {
          promptAction.showToast({
            message: $r('app.string.alert'),
            duration: Const.DURATION,
            bottom: Const.BOTTOM
          });
        } else {
          this.play();
          Logger.info(TAG, 'documentViewPicker.select to file succeed and URI is:' + this.selectFilePath);
        }
      })
  }

  selectAlbumFile() {
    let photoPicker = new photoAccessHelper.PhotoViewPicker();
    photoPicker.select({
      MIMEType: photoAccessHelper.PhotoViewMIMETypes.VIDEO_TYPE,
      maxSelectNumber: 1
    })
      .then((photoSelectResult) => {
        this.selectFilePath = photoSelectResult.photoUris[0];
        if (this.selectFilePath == null) {
          promptAction.showToast({
            message: $r('app.string.alert'),
            duration: Const.DURATION,
            bottom: Const.BOTTOM
          });
        } else {
          this.play();
          Logger.info(TAG, 'documentViewPicker.select to file succeed and URI is:' + this.selectFilePath);
        }
      })
  }

  formatDuration(durationInMicroseconds: number): string {
    const totalSeconds = Math.floor(durationInMicroseconds / 1000000);
    const hours = Math.floor(totalSeconds / 3600);
    const minutes = Math.floor((totalSeconds % 3600) / 60);
    const seconds = totalSeconds % 60;
    return `${String(hours).padStart(2, '0')}:${String(minutes).padStart(2, '0')}:${String(seconds).padStart(2, '0')}`;
  }


  play() {
    let inputFile = fileIo.openSync(this.selectFilePath, fileIo.OpenMode.READ_ONLY);
    if (!inputFile) {
      Logger.error(TAG, 'player inputFile is null');
    }
    let inputFileState = fileIo.statSync(inputFile.fd);
    if (inputFileState.size <= 0) {
      Logger.error(TAG, 'player inputFile size is 0');
    }
    player.InitFdNative(inputFile.fd, Const.DEFAULT_VALUE, inputFileState.size, () => {
      Logger.info(TAG, 'player JSCallback');
      fileIo.close(inputFile);
    },)
    this.playStatus = 'selected';
  }

  updateProgress(progressTime:number){
    this.progressTime = progressTime;
    this.progress = this.formatDuration(this.progressTime);
    this.progressBarNumber = 260*(this.progressTime/this.durationTime);
  }

  onPageShow() {
    player.resumeNative();
  }

  onPageHide() {
    player.pauseNative();
  }



  build() {
    Column(){
      Row(){
        XComponent({
          id: 'player',
          type: XComponentType.SURFACE,
          libraryname: 'player'
        })
          .height(Const.FULL_SIZE)
          .width(Const.FULL_SIZE)
          .visibility(this.xComponentStatus)
          .zIndex(0)
      }
      .width("100%")
      .height(400)
      // .aspectRatio(16/9)
      .backgroundColor('black')
      .onTouch((event: TouchEvent)=>{
        const type:TouchType = event.type;
        if(type == TouchType.Down){
          const x:number = event.touches[0].x;
          this.touchX = x;
        }
        if(type == TouchType.Up){
          const x:number = event.touches[0].x;
          if(x > this.touchX){
            let seekTime = this.progressTime/1000 + 10000
            if(seekTime > this.durationTime/1000){
              seekTime = this.durationTime/1000;
            }
            player.seekAccNative(seekTime)
          }else if(x < this.touchX){
            let seekTime = this.progressTime/1000 - 10000
            if(seekTime < 0){
              seekTime = 0;
            }
            player.seekAccNative(seekTime)
          }
        }
      })

      Row(){
        Column(){
          Button('选择视频')
            .onClick(() => {
              this.selectFile();
            })
            .width('80%')
            .height("80%")
            .backgroundColor('#ffff0033')
            .margin({top: 3})
        }
        .width('25%')
        .height('100%')
      }
      .width("100%")
      .height("30")
      .margin({top: 20})
      Row(){
        Column(){
          Button('准备')
            .enabled(this.playStatus == 'selected')
            .onClick(() => {
              player.createPrepareNative();
              this.playStatus = 'prepared'
            })
            .width('80%')
            .height("80%")
            .backgroundColor('#FF4500')
            .margin({top: 3})
        }
        .width('25%')
        .height('100%')
        Column(){
          Button('解码')
            .enabled(this.playStatus == 'prepared')
            .onClick(() => {
              player.startDecoderNative();
              this.durationTime = player.getDurationTime();
              this.duration = this.formatDuration(this.durationTime);
              this.playStatus = 'ready'
            })
            .width('80%')
            .height("80%")
            .backgroundColor('#FF4500')
            .margin({top: 3})
        }
        .width('25%')
        .height('100%')
        Column(){
          Button('首帧')
            .enabled(this.playStatus == 'prepared' || this.playStatus == 'ready')
            .onClick(() => {
              player.renderFirstFrameNative();
              this.durationTime = player.getDurationTime();
              this.duration = this.formatDuration(this.durationTime);
              this.xComponentStatus = Visibility.Visible;
              this.playStatus = 'ready'
            })
            .width('80%')
            .height("80%")
            .backgroundColor('#FF4500')
            .margin({top: 3})
        }
        .width('25%')
        .height('100%')
        Column(){
          Select([
            { value: '视频' },
            { value: '音频' },
            { value: '音视频' },
          ])
            .value('播放')
            .controlSize(ControlSize.SMALL)
            .enabled(this.playStatus == 'ready')
            .backgroundColor('#FF4500')
            .onSelect((index: number, text?: string | undefined) => {
              console.info('Select:' + index)
              this.xComponentStatus = Visibility.Visible;
              if (index === 0) {
                player.startRenderNative()
              } else if (index === 1) {
                player.startAudioNative()
              } else if (index === 2) {
                player.startRenderNative()
                player.startAudioNative()
              }
              this.intervalId = setInterval(()=>{
                this.progressTime = player.getProgressTime();
                this.progress = this.formatDuration(this.progressTime);
                this.progressBarNumber = Math.floor(260*(this.progressTime/this.durationTime));
              }, 300);
              this.playStatus = 'playing'
            })
        }
        .width('25%')
        .height('100%')
      }
      .width("100%")
      .height("30")
      .margin({top: 20})
      Row(){
        Column(){
          Button(this.playStatus == 'pausing' ? '继续':'暂停')
            .enabled(this.playStatus == 'playing' || this.playStatus == 'pausing')
            .onClick(() => {
              if(this.playStatus == 'pausing'){
                setTimeout(()=>{
                  player.resumeNative();
                  this.playStatus = 'playing';
                }, 0)
              }else if(this.playStatus == 'playing') {
                setTimeout(()=>{
                  player.pauseNative();
                  this.playStatus = 'pausing'
                }, 0)
              }
            })
            .width('80%')
            .height("80%")
            .backgroundColor('#FF4500')
            .margin({top: 3})
        }
        .width('25%')
        .height('100%')
        Column(){
          Button('重置')
            .enabled(this.playStatus == 'playing' || this.playStatus == 'pausing')
            .onClick(() => {
              this.xComponentStatus = Visibility.Hidden;
              player.resetNative();
            })
            .width('80%')
            .height("80%")
            .backgroundColor('#FF4500')
            .margin({top: 3})
        }
        .width('25%')
        .height('100%')
        Column(){
          Button('释放')
            .enabled(this.playStatus == 'playing' || this.playStatus == 'pausing')
            .onClick(() => {
              this.xComponentStatus = Visibility.Hidden;
              player.releaseNative();
            })
            .width('80%')
            .height("80%")
            .backgroundColor('#FF4500')
            .margin({top: 3})
        }
        .width('25%')
        .height('100%')
        Column(){
          Button('停止')
            .enabled(this.playStatus == 'playing' || this.playStatus == 'pausing')
            .onClick(() => {
              player.stopNative();
            })
            .width('80%')
            .height("80%")
            .backgroundColor('#FF4500')
            .margin({top: 3})
        }
        .width('25%')
        .height('100%')
      }
      .width("100%")
      .height("30")
      .margin({top: 20})
      Row(){
        Column(){
          Button('音量-')
            .enabled(this.playStatus == 'playing' || this.playStatus == 'pausing')
            .onClick(() => {
              this.volume = this.volume - 10;
              if(this.volume <= 0){
                this.volume = 0;
              }
              player.setVolumeNative(this.volume/100);
            })
            .width('80%')
            .height("80%")
            .backgroundColor('#FF4500')
            .margin({top: 3})
        }
        .width('25%')
        .height('100%')
        Column(){
          Button('音量+')
            .enabled(this.playStatus == 'playing' || this.playStatus == 'pausing')
            .onClick(() => {
              this.volume = this.volume + 10;
              if(this.volume >= 100){
                this.volume = 100;
              }
              player.setVolumeNative(this.volume/100);
            })
            .width('80%')
            .height("80%")
            .backgroundColor('#FF4500')
            .margin({top: 3})
        }
        .width('25%')
        .height('100%')
        Column(){
          Select([
            { value: '前向关键帧' },
            { value: '后向关键帧' },
            { value: '最近关键帧' },
          ])
            .value('前向关键帧')
            .controlSize(ControlSize.SMALL)
            .backgroundColor('#FF4500')
            .onSelect((index: number, text?: string | undefined) => {
              console.info('Select:' + index)
              if (index === 0) {
                this.seekMode = 1;//前向
              } else if (index === 1) {
                this.seekMode = 0;//后向
              } else if (index === 2) {
                this.seekMode = 2;//最近
              }
            })
        }
        .width('25%')
        .height('100%')
      }
      .width("100%")
      .height("30")
      .margin({top: 20})
    }
    .backgroundColor('white')
    .width('100%')
    .height('100%')
    .padding({top: 40})
  }
}