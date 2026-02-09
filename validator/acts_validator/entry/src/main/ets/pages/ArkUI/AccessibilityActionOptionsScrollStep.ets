/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import FirstDialog from '../model/FirstDialog';
import { AttributeUpdater } from '@kit.ArkUI';

const TAG = '[AccessibilityActionOptions({scrollStep})]';

class SliderModifier implements AttributeModifier<SliderAttribute> {
  applyNormalAttribute(instance: SliderAttribute): void {
    instance
      .showSteps(true)
      .stepSize('4vp')
      .accessibilityActionOptions({ scrollStep: 5 })
  }
}

let uiContent:UIContext | undefined = undefined;
@Entry
@Component
struct OnAccessibilityActionIntercept {
  @State name: string = 'OnAccessibilityActionIntercept';
  @State stepTips: string = '不支持屏幕朗读直接按照失败处理走豁免\n'+'设备支持屏幕朗读时\n' + '操作步骤:\n' +
    '1、单击accessibilityActionOptions({scrollStep:5})文字下的Slider组件使其获焦\n' +
    '2、单指下滑或者单指上滑屏幕空白区域\n' +
    '3、单击accessibilityActionOptions({scrollStep:0})文字下的Slider组件使其获焦\n' +
    '4、单指下滑或者单指上滑屏幕空白区域\n' +
    '5、单击accessibilityActionOptions({scrollStep:undefined})文字下的Slider组件使其获焦\n' +
    '6、单指下滑或者单指上滑屏幕空白区域\n' +
    '7、单击accessibilityActionOptions({scrollStep:null})文字下的Slider组件使其获焦\n' +
    '8、单指下滑或者单指上滑屏幕空白区域\n' +
    '9、单击modifier文字下的Slider组件使其获焦\n' +
    '10、单指下滑或者单指上滑屏幕空白区域\n' +
    '预期结果：\n' +
    '1、accessibilityActionOptions({scrollStep:5})文字下的Slider组件获焦”\n' +
    '2、单指下滑或者单指上滑屏幕空白区域，Slider组件进度每次滚动距离为50\n' +
    '3、accessibilityActionOptions({scrollStep:0})文字下的Slider组件获焦”\n' +
    '4、单指下滑或者单指上滑屏幕空白区域，Slider组件进度每次滚动距离为10\n' +
    '5、accessibilityActionOptions({scrollStep:undefined})文字下的Slider组件获焦\n' +
    '6、单指下滑或者单指上滑屏幕空白区域，Slider组件进度每次滚动距离为10\n' +
    '7、accessibilityActionOptions({scrollStep:null})文字下的Slider组件获焦\n' +
    '8、单指下滑或者单指上滑屏幕空白区域，Slider组件进度每次滚动距离为10\n' +
    '9、modifier文字下的Slider组件获焦\n' +
    '10、单指下滑或者单指上滑屏幕空白区域，Slider组件进度每次滚动距离为50\n'
  @State vueStatus: boolean = false;
  @State status1: boolean = false;
  @State status2: boolean = false;
  @State status3: boolean = false;
  @State status4: boolean = false;
  @State status5: boolean = false;
  @State active: boolean = false;
  @State intervalNum: number = 0;
  @State yesEnable: boolean = false
  // 默认不支持
  @State onAccessibilityHoverEnable: boolean = false;
  @State color: Color = Color.Blue;
  @State text1: string = ''
  @State text2: string = ''
  @State text3: string = ''
  @State text4: string = ''

  @State currentIndex: number = 0
  @State selectedFontColor: string = '#007DFF'
  @State fontColor: string = '#182431'
  @State inSetValue1: number = 40;
  @State inSetValue2: number = 40;
  @State inSetValue3: number = 40;
  @State inSetValue4: number = 40;
  @State inSetValue5: number = 40;
  @State modifier : SliderModifier = new SliderModifier()

  @Builder
  PassBtn(text: Resource, isFullScreen: boolean) {
    if (this.vueStatus) {
      Button({ stateEffect: this.vueStatus }) {
        Image($r('app.media.ic_public_pass'))
          .width('20vp')
          .height('20vp')
      }.width('30%')
      .height('30vp')
      .backgroundColor(Color.Grey)
      .onClick(() => {
        router.back({
          url: 'pages/ArkUI/ArkUI_index',
          params: {
            result: 'true ', title: this.name,
          }
        })
        promptAction.showToast({
          message: '通过', duration: 1000
        });
      })
    } else {
      Button({ stateEffect: this.vueStatus }) {
        Image($r('app.media.ic_public_pass'))
          .width('20vp')
          .height('20vp')
      }
      .width('30%')
      .height('30vp')
      .backgroundColor(Color.Grey)
      .opacity(0.4)
      .onClick(() => {
      })
    }
  }

  @Builder
  FailBtn(text: Resource, isFullScreen: boolean) {
    Button() {
      Image($r('app.media.ic_public_fail'))
        .width('20vp')
        .height('20vp')
    }
    .width('30%')
    .height('30vp')
    .backgroundColor(Color.Grey)
    .onClick(() => {
      router.back({
        url: 'pages/ArkUI/ArkUI_index',
        params: {
          result: 'false', title: this.name,
        }
      })
      promptAction.showToast({
        message: '失败', duration: 1000
      });
    })
  }

  aboutToAppear() {
    FirstDialog.ChooseDialog(this.stepTips, this.name);
  }

  onPageShow() {
    this.intervalNum = setInterval(() => {
      if (this.text1 === 'HOVER_ENTER' && this.text2 === 'HOVER_MOVE' && this.text3 === 'HOVER_EXIT' &&
        this.text4 === 'HOVER_CANCEL') {
        this.vueStatus = true;
      }
    }, 500)
  }

  onPageHide() {
    clearInterval(this.intervalNum)
  }

  aboutToDisappear() {
    clearInterval(this.intervalNum)
  }
  build() {
    NavDestination() {
      Column({ space: 10 }) {
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
              url: 'pages/ArkUI/ArkUI_index',
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
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)

        Row({ space: 10 }) {
          Text(`是否设备支持屏幕朗读`).fontColor(Color.Green).fontSize('18fp').margin({ top: 20 })
        }

        Row({ space: 10 }) {
          Column() {
            Button(`不支持`)
              .borderRadius(8)
              .backgroundColor(0x317aff)
              .width('30%')
              .enabled(!this.yesEnable)
              .opacity(!this.yesEnable ? 1 : 0.4)
              .onClick(async () => {
              })
          }

          Column() {
            Button(`支持`)
              .borderRadius(8)
              .backgroundColor(0x317aff)
              .width('30%')
              .onClick(async () => {
                this.yesEnable = true
                this.onAccessibilityHoverEnable = true
              })
          }
        }


        Column(){
          Text('accessibilityActionOptions({scrollStep:5})')
          Row() {
            Slider({
              value: this.inSetValue1,
              step: 10,
              style: SliderStyle.InSet
            })
              .accessibilityActionOptions({scrollStep:5})
              .blockColor('#191970')
              .trackColor('#ADD8E6')
              .selectedColor('#4169E1')
              .showSteps(true)
              .onChange((value: number, mode: SliderChangeMode) => {
                this.inSetValue1 = value;
                console.info('value:' + value + 'mode:' + mode.toString());
                this.status1 = true;
                if(this.status1 && this.status2 && this.status3 && this.status4 && this.status5){
                  this.vueStatus = true;
                }else{
                  this.vueStatus = false;
                }
              })
            Text(this.inSetValue1.toFixed(0)).fontSize(12)
          }
          .width('80%')
        }
        Column(){
          Text('accessibilityActionOptions({scrollStep:0})')
          Row() {
            Slider({
              value: this.inSetValue5,
              step: 10,
              style: SliderStyle.InSet
            })
              .accessibilityActionOptions({scrollStep:-1})
              .blockColor('#191970')
              .trackColor('#ADD8E6')
              .selectedColor('#4169E1')
              .showSteps(true)
              .onChange((value: number, mode: SliderChangeMode) => {
                this.inSetValue5 = value;
                console.info('value:' + value + 'mode:' + mode.toString());
                this.status5 = true;
                if(this.status1 && this.status2 && this.status3 && this.status4 && this.status5){
                  this.vueStatus = true;
                }else{
                  this.vueStatus = false;
                }
              })
            Text(this.inSetValue5.toFixed(0)).fontSize(12)
          }
          .width('80%')
        }
        Column(){
          Text('accessibilityActionOptions({scrollStep:undefined})')
          Row() {
            Slider({
              value: this.inSetValue2,
              step: 10,
              style: SliderStyle.InSet
            })
              .accessibilityActionOptions({scrollStep:undefined})
              .blockColor('#191970')
              .trackColor('#ADD8E6')
              .selectedColor('#4169E1')
              .showSteps(true)
              .onChange((value: number, mode: SliderChangeMode) => {
                this.inSetValue2 = value;
                console.info('value:' + value + 'mode:' + mode.toString());
                this.status2 = true;
                if(this.status1 && this.status2 && this.status3 && this.status4 && this.status5){
                  this.vueStatus = true;
                }else{
                  this.vueStatus = false;
                }
              })
            Text(this.inSetValue2.toFixed(0)).fontSize(12)
          }
          .width('80%')
        }
        Column(){
          Text('accessibilityActionOptions({scrollStep:null})')
          Row() {
            Slider({
              value: this.inSetValue3,
              step: 10,
              style: SliderStyle.InSet
            })
              .accessibilityActionOptions({scrollStep:null})
              .blockColor('#191970')
              .trackColor('#ADD8E6')
              .selectedColor('#4169E1')
              .showSteps(true)
              .onChange((value: number, mode: SliderChangeMode) => {
                this.inSetValue3 = value;
                console.info('value:' + value + 'mode:' + mode.toString());
                this.status3 = true;
                if(this.status1 && this.status2 && this.status3 && this.status4 && this.status5){
                  this.vueStatus = true;
                }else{
                  this.vueStatus = false;
                }
              })
            Text(this.inSetValue3.toFixed(0)).fontSize(12)
          }
          .width('80%')
        }
        Column(){
          Text('modifier')
          Row() {
            Slider({
              value: this.inSetValue4,
              step: 10,
              style: SliderStyle.InSet
            })
              .attributeModifier(this.modifier)
              .blockColor('#191970')
              .trackColor('#ADD8E6')
              .selectedColor('#4169E1')
              .showSteps(true)
              .onChange((value: number, mode: SliderChangeMode) => {
                this.inSetValue4 = value;
                console.info('value:' + value + 'mode:' + mode.toString());
                this.status4 = true;
                if(this.status1 && this.status2 && this.status3 && this.status4 && this.status5){
                  this.vueStatus = true;
                }else{
                  this.vueStatus = false;
                }
              })
            Text(this.inSetValue4.toFixed(0)).fontSize(12)
          }
          .width('80%')
        }

        Row({ space: 10 }) {
          this.PassBtn($r('app.string.btn_fullscreen'), true);
          Button() {
            Image($r('app.media.ic_public_help'))
              .width('20vp')
              .height('20vp')
          }
          .width('30%')
          .height('30vp')
          .backgroundColor(Color.Grey)
          .onClick(() => {
            AlertDialog.show(
              {
                title: '操作提示',
                message: this.stepTips,
                confirm: {
                  value: 'OK',
                  action: () => {
                  }
                }
              }
            )
          })
          this.FailBtn($r('app.string.btn_fullscreen'), true);
        }
        .padding(20)
        .width('100%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .backgroundColor(Color.Black)
      }.width('100%').height('100%')
    }
  }
}