/*
* Copyright (c) 2023 Hunan OpenValley Digital Industry Development Co., Ltd.
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

import { CustomContainer } from '../common/CameraFlashContainer';
import FirstDialog from '../model/FirstDialog';
import router from '@ohos.router';
import screenshot from '@ohos.screenshot';
import { BusinessError } from '@ohos.base';

@Entry
@Component
struct ScreenShot {
  @State FillColor: string = '#FF000000';
  @State name: string = 'ScreenPick';
  @State resMessage : String = ' ';
  @State StepTips: string = '测试目的：用于测试拉起截屏应用，只支持PC设备\n操作步骤：点击按钮，查看是否拉起截屏应用，若不支持该功能则标记失败\n预期结果：PC设备可以拉起截屏应用，其他设备返回801错误码';
  @State Vue: boolean = false;
  @State isFlush: boolean = false;
  @State isPass: boolean = false;
  @State intervalNum: number = 0;
  @State hid: number = 25;
  @State textNum: number = 1;
  @State isScroll: boolean = true

 //拉起截屏应用
  pick(){
    try {
      let promise = screenshot.pick();
      promise.then((pickInfo: screenshot.PickInfo) => {
        console.log('pick Pixel bytes number: ' + pickInfo.pixelMap.getPixelBytesNumber());
        console.log('pick Rect: ' + pickInfo.pickRect);
        console.log('pick Rect: left:' + pickInfo.pickRect.left+',top:'+pickInfo.pickRect.top+',width:'+pickInfo.pickRect.width +',height:'+pickInfo.pickRect.height);
        pickInfo.pixelMap.release(); // PixelMap使用完后及时释放内存
        this.resMessage = '拉起截屏应用成功';
        if (this.resMessage!=' ') {
          this.Vue = true;
        }
      }).catch((err: BusinessError) => {
        console.log('Failed to pick. Code: ' + JSON.stringify(err));
        this.resMessage = '拉起截屏应用失败： '+ err.code;
        if (this.resMessage!=' ') {
          this.Vue = true;
        }
      });
    } catch (exception) {
      console.error('Failed to pick Code: ' + JSON.stringify(exception));
      this.resMessage = '拉起截屏应用失败： '+ exception.code;
    };
  }

  async aboutToAppear() {
    await FirstDialog.ChooseDialog(this.StepTips, this.name)
  }

  build() {
    Stack() {
      Column() {
        Row() {
          Button() {
            Image($r('app.media.ic_public_back'))
              .width('20vp')
              .height('18vp')
              .margin({ left: '20vp' })
          }
          .backgroundColor(Color.Black)
          .size({ width: '40vp', height: '30vp' })
          .onClick(() => {
            router.back({
              url: 'pages/Screen/Screen_index',
              params: { result: 'None' }
            })
          })

          Text(this.name)
            .fontColor(Color.White)
            .fontSize('18fp')
            .margin({ left: '-20vp' })
          Text('hello')
            .fontColor(Color.White)
            .visibility(Visibility.Hidden)
        }
        .backgroundColor(Color.Black)
        .height('10%')
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)
        .zIndex(1)

        Row() {
          Column() {
            Row() {
              Text(`返回值：${this.resMessage}`).fontSize(24)
            }.height('70%')
            .width('100%')
            .backgroundColor('green')

            Row() {
              Button('拉起截屏应用')
                .width('80%')
                .height('100%')
                .margin({ top: '40vp'})
            }
            .justifyContent(FlexAlign.SpaceBetween)
            .onClick(() => {
              this.pick()
            })
            .height('10%')
            .zIndex(2)
          }

          Text(`返回值：${this.resMessage}`)
        }.height('80%')
        .width('100%')
        .margin({ bottom: '-10vp' })
        CustomContainer({
          title: this.name,
          Url: 'pages/Screen/Screen_index',
          StepTips: this.StepTips,
          FillColor: $FillColor,
          name: $name,
          Vue: $Vue,
          isFlash: $isFlush
        })
          .height('10%')
          .width('100%')
          .zIndex(2)
      }
      .width('100%')
      .height('100%')
      .backgroundColor(Color.Black)
    }
  }

  onBackPress() {
    router.replaceUrl({
      url: 'pages/Screen/Screen_index'
    })
  }
}