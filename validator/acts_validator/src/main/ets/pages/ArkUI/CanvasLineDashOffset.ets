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
import router from '@ohos.router';
import {CustomContainer} from '../common/CanvasCustomContainer2';
import FirstDialog from '../model/FirstDialog';
@Entry
@Component
struct SetCircle {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  @State FillColor: string = '#FF000000';
  @State X: number = 0;
  @State name: string = 'CanvasLineDashOffset';
  @State StepTips: string = '操作步骤：拖动滑块向右移动'+'\n'+'预期结果：虚线偏移量随着拖拽距离而改变，并显示偏移量';
  @State Vue: boolean = false;
  async aboutToAppear(){
    await FirstDialog.ChooseDialog(this.StepTips,this.name);
  }
  @Builder specificNoParam() {
    Column() {
      Scroll() {
        Column() {
          Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }){
            Row() {
              Slider({
                value: this.X,
                min: 0,
                max: 100,
                style: SliderStyle.OutSet,
              })
                .trackColor('#4DCB26')
                .selectedColor('#00A7FA')
                .trackThickness('8vp')
                .blockBorderColor('#07B9A2')
                .blockBorderWidth('1vp')
                .onChange((value: number, mode: SliderChangeMode) => {
                  this.X = value;
                  this.context.clearRect(100, 90, 250, 200);
                  this.context.setLineDash([20,30]);
                  this.context.beginPath();
                  this.context.arc(180, 150, 50, 0, 6.28);
                  this.context.lineDashOffset = (this.X) * 0.4;
                  this.context.stroke();
                  if ( value >= 100 ){
                    this.Vue = true;
                  }
                })
            }
          }.width('70%').height('25%')
          Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
            Text('虚线偏移量: ' + (this.X)*0.4 )
          }.width('100%').height('20%')
          Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
            Canvas(this.context)
              .width('100%')
              .height('100%')
              .backgroundColor('#ffffffff')
              .onReady(() =>{
              })
          }.width('100%').height('55%')
        }
      }.scrollBarWidth('6vp').scrollBarColor('#cccccc')
    }.width('100%').height('80%').backgroundColor(Color.White)
  }
  build() {
    Column() {
      CustomContainer({
        title: this.name,
        Url: 'pages/ArkUI/ArkUI_index',
        StepTips: this.StepTips,
        content: this.specificNoParam,
        FillColor: $FillColor,
        X: $X,
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