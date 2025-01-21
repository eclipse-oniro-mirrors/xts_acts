/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import promptAction from '@ohos.promptAction';
import fs from '@ohos.file.fs';
import router from '@ohos.router';
import screenshot from '@ohos.screenshot';
import image from '@ohos.multimedia.image';
import Logger from '../model/Logger'
import FirstDialog from '../model/FirstDialog';
import mediaLibrary from '@ohos.multimedia.mediaLibrary';
const TAG = '[Screenshot]';
let path = globalThis.dir;
@Component
struct CustomContainer1 {
  @Link x: number;
  @Link y: number;
  @Link isshow: Visibility;
  @Link name:string;
  title : string = '';
  StepTips: string = '';
  Url : string = '';
  @Link Vue : boolean;
  @BuilderParam content: () => void;
  @Builder
  PassBtn(text: Resource, isFullScreen: boolean) {
    if(this.Vue == false){
      Button({stateEffect:this.Vue}) {
        Image($r('app.media.ic_public_pass')).width('20vp').height('20vp')
      }.width('30%').height('30vp').backgroundColor(Color.Grey).opacity(0.4)
      .onClick(()=>{

      })
    }
    else{
      Button({stateEffect:this.Vue}) {
        Image($r('app.media.ic_public_pass')).width('20vp').height('20vp')
      }.width('30%').height('30vp').backgroundColor(Color.Grey)
      .onClick(()=>{
        router.back({
          url:this.Url,
          params: {result : 'true ', title : this.name,
          }
        })
        this.getScreen(isFullScreen);
        promptAction.showToast({
          message: '通过', duration: 1000
        });
      })
    }
  }
  @Builder
  FailBtn(text: Resource, isFullScreen: boolean) {
    Button(){
      Image($r('app.media.ic_public_fail')).width('20vp').height('20vp')
    }.width('30%').height('30vp').backgroundColor(Color.Grey)
    .onClick(()=>{
      router.back({
        url:this.Url,
        params: {result : 'false',title : this.name,
        }
      })
      this.getScreen(isFullScreen);
      promptAction.showToast({
        message: '失败', duration: 1000
      });
    })
  }
  build() {
    Column() {
      Row() {
        Button(){
          Image($r('app.media.ic_public_back')).width('20vp').height('18vp').margin({left:'20vp'})
        }.backgroundColor(Color.Black).size({ width: '40vp', height: '30vp' })
        .onClick(()=>{
          router.back({
            url:this.Url,
            params: {result : 'None', title:this.name,}
          })
        })
        Text(this.title).fontColor(Color.White).fontSize('18fp').margin({left:'-20vp'})
        Text('hello').fontColor(Color.White).visibility(Visibility.Hidden)
      }.backgroundColor(Color.Black).height('10%').width('100%').justifyContent(FlexAlign.SpaceBetween)
      this.content();
      Blank()
      Row() {
        this.PassBtn($r('app.string.btn_fullscreen'), true);
        Button(){
          Image($r('app.media.ic_public_help')).width('20vp').height('20vp')
        }.width('30%').height('30vp').backgroundColor(Color.Grey)
        .onClick(() =>{
          AlertDialog.show(
            {
              title:'操作提示',
              message: this.StepTips,
              confirm:{
                value:'OK',
                action:()=>{
                }
              }
            }
          )
        })
        this.FailBtn($r('app.string.btn_fullscreen'), true);
      }.width('100%').justifyContent(FlexAlign.SpaceEvenly).backgroundColor(Color.Black)
    }.height('98%').width('100%')
  }
  async savePicture(data: image.PixelMap, context: any) {
    Logger.info(TAG, `savePicture`)
    let packOpts: image.PackingOption = {
      format: "image/jpeg", quality: 100
    };
    let info = {
      prefix: 'IMG_', suffix: '.jpg', directory: mediaLibrary.DirectoryType.DIR_IMAGE
    };
    let name = this.name;
    let displayName = `${info.prefix}${name}${info.suffix}`;
    let dirPath = path + '/screenshot' + '/' + displayName;
    let imagePackerApi = image.createImagePacker();
    let arrayBuffer = await imagePackerApi.packing(data, packOpts);
    let fd = fs.openSync(dirPath,fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    imagePackerApi.release();
    try {
      await fs.write(fd.fd, arrayBuffer);
    } catch (err) {
      Logger.error(`write failed, code is ${err.code}, message is ${err.message}`);
    }
    await fs.close(fd);
    Logger.info(TAG, `write done`);
  }
  getScreen = (isFullScreen: boolean) => {
    let screenshotOptions: screenshot.ScreenshotOptions = {
      screenRect: { left: 0, top: 0, width: 400, height: 400 },
      imageSize: { width: 400, height: 400 },
      rotation: 0,
      displayId: 0
    };
    if (isFullScreen) {
      screenshotOptions = {
        rotation: 0
      }
    }
    try {
      screenshot.save(screenshotOptions, (err, data: image.PixelMap) => {
        if (err) {
          Logger.info(TAG, `Failed to save the screenshot. Error:${JSON.stringify(err)}`);
        }
        Logger.info(TAG, 'save callback');
        this.savePicture(data, getContext(this) as any);
      })
    } catch (err) {
      Logger.error(`save failed, code is ${err.code}, message is ${err.message}`);
    }
  }
}

@Entry
@Component
struct SetCircle {
  @State x: number = 0;
  @State y: number = 0;
  @State Vue: boolean = false;
  @State isshow: Visibility = Visibility.None;
  @State name: string = 'TouchMove';
  @State StepTips: string = '操作步骤：手指触摸屏幕并滑动' + '\n' + '预期结果：在手指触摸处出现红色圆圈，并跟随手指滑动';
  async aboutToAppear(){
    await FirstDialog.ChooseDialog(this.StepTips,this.name);
  }
  @Builder specificNoParam1() {
    Column() {
      Circle()
        .width('20vp').height('20vp').position({ x: this.x, y: this.y }).visibility(this.isshow)
        .fill(Color.Red)
    }.onTouch((event: TouchEvent) => {
      let x = event.touches[0].x;
      let y = event.touches[0].y;
      if (event.type === TouchType.Down) {
        this.x = x;
        this.y = y;
        this.isshow = Visibility.Visible;
      }
      else if (event.type === TouchType.Move) {
        this.x = x;
        this.y = y;
        this.isshow = Visibility.Visible;
      }
      else if (event.type === TouchType.Up) {
        this.isshow = Visibility.None;
      }
      this.Vue = true;
    })
    .width('100%').height('80%').backgroundColor(Color.White)

  }

  build() {
    Column() {
      CustomContainer1({
        title: this.name,
        Url: 'pages/ArkUI/ArkUI_index',
        StepTips: this.StepTips,
        content: this.specificNoParam1,
        x: $x,
        y: $y,
        isshow: $isshow,
        name: $name,
        Vue: $Vue,
      })
    }.width('100%').height('100%').backgroundColor(Color.Black)
  }
  onBackPress(){
    router.replaceUrl({
      url:'pages/ArkUI/ArkUI_index',
    })
  }
}
