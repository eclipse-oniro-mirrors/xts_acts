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
import {CustomContainer} from '../common/CanvasCustomContainer1';
import FirstDialog from '../model/FirstDialog';
@Entry
@Component
struct SetCircle {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  @State FillColor: string = '#FF000000';
  @State name: string = 'CanvasGlobalCompositeOperation';
  @State StepTips: string = '操作步骤：点击不同的合成操作的方式'+'\n'+'预期结果：原本默认合成方式会随点击变化（红色为先绘制内容，蓝色为后绘制内容）';
  @State Vue: boolean = false;
  @State num1: number = 0;
  @State num2: number = 0;
  @State num3: number = 0;
  @State num4: number = 0;
  @State num5: number = 0;
  @State num6: number = 0;
  @State num7: number = 0;
  @State num8: number = 0;
  @State num9: number = 0;
  @State num10: number = 0;
  @State num11: number = 0;
  async aboutToAppear(){
    await FirstDialog.ChooseDialog(this.StepTips,this.name);
  }
  @Builder specificNoParam() {
    Column() {
      Scroll() {
        Column() {
          Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }){
            Row(){
              Text('').fontSize(0).border({width:0}).size({width:'0%',height:'2%'})
            }
            Row({space:10}){
              Toggle({type:ToggleType.Button, isOn:false}){
                Text('s-over').fontSize(13)
              }
              .size({width:'18%',height:'20%'})
              .onChange(()=>{
                this.context.clearRect(0, 10, 350, 300);
                this.context.fillStyle = 'rgb(255,0,0)';
                this.context.fillRect(150, 150, 50, 50);
                this.context.globalCompositeOperation = 'source-over';
                this.context.fillStyle = 'rgb(0,0,255)';
                this.context.fillRect(180, 180, 50, 50);
                this.context.clearRect(0, 10, 350, 300);
                this.context.fillStyle = 'rgb(255,0,0)';
                this.context.fillRect(150, 150, 50, 50);
                this.context.globalCompositeOperation = 'source-over';
                this.context.fillStyle = 'rgb(0,0,255)';
                this.context.fillRect(180, 180, 50, 50);
                this.num1 = 1;
                if( this.num1 == 1 && this.num2 == 1 && this.num3 == 1 && this.num4 == 1 && this.num5 == 1
                && this.num6 == 1 && this.num7 == 1 && this.num8 == 1 && this.num9 == 1 && this.num10 == 1
                && this.num11 == 1 ){
                  this.Vue = true;
                }
              })
              Toggle({type:ToggleType.Button, isOn:false}){
                Text('s-atop').fontSize(13)
              }
              .size({width:'18%',height:'20%'})
              .onChange(()=>{
                this.context.clearRect(0, 10, 350, 300);
                this.context.fillStyle = 'rgb(255,0,0)';
                this.context.fillRect(150, 150, 50, 50);
                this.context.globalCompositeOperation = 'source-over';
                this.context.fillStyle = 'rgb(0,0,255)';
                this.context.fillRect(180, 180, 50, 50);
                this.context.clearRect(0, 10, 350, 300);
                this.context.fillStyle = 'rgb(255,0,0)';
                this.context.fillRect(150, 150, 50, 50);
                this.context.globalCompositeOperation = 'source-atop';
                this.context.fillStyle = 'rgb(0,0,255)';
                this.context.fillRect(180, 180, 50, 50);
                this.num2 = 1;
                if( this.num1 == 1 && this.num2 == 1 && this.num3 == 1 && this.num4 == 1 && this.num5 == 1
                && this.num6 == 1 && this.num7 == 1 && this.num8 == 1 && this.num9 == 1 && this.num10 == 1
                && this.num11 == 1 ){
                  this.Vue = true;
                }
              })
              Toggle({type:ToggleType.Button, isOn:false}){
                Text('s-in').fontSize(13)
              }
              .size({width:'18%',height:'20%'})
              .onChange(()=>{
                this.context.clearRect(0, 10, 350, 300);
                this.context.fillStyle = 'rgb(255,0,0)';
                this.context.fillRect(150, 150, 50, 50);
                this.context.globalCompositeOperation = 'source-over';
                this.context.fillStyle = 'rgb(0,0,255)';
                this.context.fillRect(180, 180, 50, 50);
                this.context.clearRect(0, 10, 350, 300);
                this.context.fillStyle = 'rgb(255,0,0)';
                this.context.fillRect(150, 150, 50, 50);
                this.context.globalCompositeOperation = 'source-in';
                this.context.fillStyle = 'rgb(0,0,255)';
                this.context.fillRect(180, 180, 50, 50);
                this.num3 = 1;
                if( this.num1 == 1 && this.num2 == 1 && this.num3 == 1 && this.num4 == 1 && this.num5 == 1
                && this.num6 == 1 && this.num7 == 1 && this.num8 == 1 && this.num9 == 1 && this.num10 == 1
                && this.num11 == 1 ){
                  this.Vue = true;
                }
              })
              Toggle({type:ToggleType.Button, isOn:false}){
                Text('s-out').fontSize(13)
              }
              .size({width:'18%',height:'20%'})
              .onChange(()=>{
                this.context.clearRect(0, 10, 350, 300);
                this.context.fillStyle = 'rgb(255,0,0)';
                this.context.fillRect(150, 150, 50, 50);
                this.context.globalCompositeOperation = 'source-over';
                this.context.fillStyle = 'rgb(0,0,255)';
                this.context.fillRect(180, 180, 50, 50);
                this.context.clearRect(0, 10, 350, 300);
                this.context.fillStyle = 'rgb(255,0,0)';
                this.context.fillRect(150, 150, 50, 50);
                this.context.globalCompositeOperation = 'source-out';
                this.context.fillStyle = 'rgb(0,0,255)';
                this.context.fillRect(180, 180, 50, 50);
                this.num4 = 1;
                if( this.num1 == 1 && this.num2 == 1 && this.num3 == 1 && this.num4 == 1 && this.num5 == 1
                && this.num6 == 1 && this.num7 == 1 && this.num8 == 1 && this.num9 == 1 && this.num10 == 1
                && this.num11 == 1 ){
                  this.Vue = true;
                }
              })
            }
            Row({space:10}){
              Toggle({type:ToggleType.Button, isOn:false}){
                Text('d-over').fontSize(13)
              }
              .size({width:'18%',height:'20%'})
              .onChange(()=> {
                this.context.clearRect(0, 10, 350, 300);
                this.context.fillStyle = 'rgb(255,0,0)';
                this.context.fillRect(150, 150, 50, 50);
                this.context.globalCompositeOperation = 'source-over';
                this.context.fillStyle = 'rgb(0,0,255)';
                this.context.fillRect(180, 180, 50, 50);
                this.context.clearRect(0, 10, 350, 300);
                this.context.fillStyle = 'rgb(255,0,0)';
                this.context.fillRect(150, 150, 50, 50);
                this.context.globalCompositeOperation = 'destination-over';
                this.context.fillStyle = 'rgb(0,0,255)';
                this.context.fillRect(180, 180, 50, 50);
                this.num5 = 1;
                if( this.num1 == 1 && this.num2 == 1 && this.num3 == 1 && this.num4 == 1 && this.num5 == 1
                && this.num6 == 1 && this.num7 == 1 && this.num8 == 1 && this.num9 == 1 && this.num10 == 1
                && this.num11 == 1 ){
                  this.Vue = true;
                }
              })
              Toggle({type:ToggleType.Button, isOn:false}){
                Text('d-atop').fontSize(13)
              }
              .size({width:'18%',height:'20%'})
              .onChange(()=> {
                this.context.clearRect(0, 10, 350, 300);
                this.context.fillStyle = 'rgb(255,0,0)';
                this.context.fillRect(150, 150, 50, 50);
                this.context.globalCompositeOperation = 'source-over';
                this.context.fillStyle = 'rgb(0,0,255)';
                this.context.fillRect(180, 180, 50, 50);
                this.context.clearRect(0, 10, 350, 300);
                this.context.fillStyle = 'rgb(255,0,0)';
                this.context.fillRect(150, 150, 50, 50);
                this.context.globalCompositeOperation = 'destination-atop';
                this.context.fillStyle = 'rgb(0,0,255)';
                this.context.fillRect(180, 180, 50, 50);
                this.num6 = 1;
                if( this.num1 == 1 && this.num2 == 1 && this.num3 == 1 && this.num4 == 1 && this.num5 == 1
                && this.num6 == 1 && this.num7 == 1 && this.num8 == 1 && this.num9 == 1 && this.num10 == 1
                && this.num11 == 1 ){
                  this.Vue = true;
                }
              })
              Toggle({type:ToggleType.Button, isOn:false}){
                Text('d-in').fontSize(13)
              }
              .size({width:'18%',height:'20%'})
              .onChange(()=> {
                this.context.clearRect(0, 10, 350, 300);
                this.context.fillStyle = 'rgb(255,0,0)';
                this.context.fillRect(150, 150, 50, 50);
                this.context.globalCompositeOperation = 'source-over';
                this.context.fillStyle = 'rgb(0,0,255)';
                this.context.fillRect(180, 180, 50, 50);
                this.context.clearRect(0, 10, 350, 300);
                this.context.fillStyle = 'rgb(255,0,0)';
                this.context.fillRect(150, 150, 50, 50);
                this.context.globalCompositeOperation = 'destination-in';
                this.context.fillStyle = 'rgb(0,0,255)';
                this.context.fillRect(180, 180, 50, 50);
                this.num7 = 1;
                if( this.num1 == 1 && this.num2 == 1 && this.num3 == 1 && this.num4 == 1 && this.num5 == 1
                && this.num6 == 1 && this.num7 == 1 && this.num8 == 1 && this.num9 == 1 && this.num10 == 1
                && this.num11 == 1 ){
                  this.Vue = true;
                }
              })
              Toggle({type:ToggleType.Button, isOn:false}){
                Text('d-out').fontSize(13)
              }
              .size({width:'18%',height:'20%'})
              .onChange(()=> {
                this.context.clearRect(0, 10, 350, 300);
                this.context.fillStyle = 'rgb(255,0,0)';
                this.context.fillRect(150, 150, 50, 50);
                this.context.globalCompositeOperation = 'source-over';
                this.context.fillStyle = 'rgb(0,0,255)';
                this.context.fillRect(180, 180, 50, 50);
                this.context.clearRect(0, 10, 350, 300);
                this.context.fillStyle = 'rgb(255,0,0)';
                this.context.fillRect(150, 150, 50, 50);
                this.context.globalCompositeOperation = 'destination-out';
                this.context.fillStyle = 'rgb(0,0,255)';
                this.context.fillRect(180, 180, 50, 50);
                this.num8 = 1;
                if( this.num1 == 1 && this.num2 == 1 && this.num3 == 1 && this.num4 == 1 && this.num5 == 1
                && this.num6 == 1 && this.num7 == 1 && this.num8 == 1 && this.num9 == 1 && this.num10 == 1
                && this.num11 == 1 ){
                  this.Vue = true;
                }
              })
            }
            Row({space:10}){
              Toggle({type:ToggleType.Button, isOn:false}){
                Text('lighter').fontSize(13)
              }
              .size({width:'18%',height:'20%'})
              .onChange(()=> {
                this.context.clearRect(0, 10, 350, 300);
                this.context.fillStyle = 'rgb(255,0,0)';
                this.context.fillRect(150, 150, 50, 50);
                this.context.globalCompositeOperation = 'source-over';
                this.context.fillStyle = 'rgb(0,0,255)';
                this.context.fillRect(180, 180, 50, 50);
                this.context.clearRect(0, 10, 350, 300);
                this.context.fillStyle = 'rgb(255,0,0)';
                this.context.fillRect(150, 150, 50, 50);
                this.context.globalCompositeOperation = 'lighter';
                this.context.fillStyle = 'rgb(0,0,255)';
                this.context.fillRect(180, 180, 50, 50);
                this.num9 = 1;
                if( this.num1 == 1 && this.num2 == 1 && this.num3 == 1 && this.num4 == 1 && this.num5 == 1
                && this.num6 == 1 && this.num7 == 1 && this.num8 == 1 && this.num9 == 1 && this.num10 == 1
                && this.num11 == 1 ){
                  this.Vue = true;
                }
              })
              Toggle({type:ToggleType.Button, isOn:false}){
                Text('copy').fontSize(13)
              }
              .size({width:'18%',height:'20%'})
              .onChange(()=> {
                this.context.clearRect(0, 10, 350, 300);
                this.context.fillStyle = 'rgb(255,0,0)';
                this.context.fillRect(150, 150, 50, 50);
                this.context.globalCompositeOperation = 'source-over';
                this.context.fillStyle = 'rgb(0,0,255)';
                this.context.fillRect(180, 180, 50, 50);
                this.context.clearRect(0, 10, 350, 300);
                this.context.fillStyle = 'rgb(255,0,0)';
                this.context.fillRect(150, 150, 50, 50);
                this.context.globalCompositeOperation = 'copy';
                this.context.fillStyle = 'rgb(0,0,255)';
                this.context.fillRect(180, 180, 50, 50);
                this.num10 = 1;
                if( this.num1 == 1 && this.num2 == 1 && this.num3 == 1 && this.num4 == 1 && this.num5 == 1
                && this.num6 == 1 && this.num7 == 1 && this.num8 == 1 && this.num9 == 1 && this.num10 == 1
                && this.num11 == 1 ){
                  this.Vue = true;
                }
              })
              Toggle({type:ToggleType.Button, isOn:false}){
                Text('xor').fontSize(13)
              }
              .size({width:'18%',height:'20%'})
              .onChange(()=> {
                this.context.clearRect(0, 10, 350, 300);
                this.context.fillStyle = 'rgb(255,0,0)';
                this.context.fillRect(150, 150, 50, 50);
                this.context.globalCompositeOperation = 'source-over';
                this.context.fillStyle = 'rgb(0,0,255)';
                this.context.fillRect(180, 180, 50, 50);
                this.context.clearRect(0, 10, 350, 300);
                this.context.fillStyle = 'rgb(255,0,0)';
                this.context.fillRect(150, 150, 50, 50);
                this.context.globalCompositeOperation = 'xor';
                this.context.fillStyle = 'rgb(0,0,255)';
                this.context.fillRect(180, 180, 50, 50);
                this.num11 = 1;
                if( this.num1 == 1 && this.num2 == 1 && this.num3 == 1 && this.num4 == 1 && this.num5 == 1
                && this.num6 == 1 && this.num7 == 1 && this.num8 == 1 && this.num9 == 1 && this.num10 == 1
                && this.num11 == 1 ){
                  this.Vue = true;
                }
              })
              Text('').fontSize(0).border({width:0}).size({width:'18%',height:'20%'})
            }
          }.width('90%').height('30%')
          Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
            Canvas(this.context)
              .width('100%')
              .height('100%')
              .backgroundColor('#ffffffff')
              .onReady(() =>{
              })
          }.width('100%').height('70%')
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