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
  @State name: string = 'CanvasFont';
  @State StepTips: string = '操作步骤：点击不同的字体控件'+'\n'+'预期结果：原本默认字体会改变';
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
  @State num12: number = 0;
  @State num13: number = 0;
  @State num14: number = 0;
  @State num15: number = 0;
  @State num16: number = 0;
  @State num17: number = 0;
  @State num18: number = 0;
  @State num19: number = 0;
  @State num20: number = 0;
  @State num21: number = 0;
  @State num22: number = 0;
  async aboutToAppear(){
    await FirstDialog.ChooseDialog(this.StepTips,this.name);
  }
  @Builder specificNoParam() {
    Column() {
      Scroll() {
        Column() {
          Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }){
            Row(){
              Text('').fontSize(0).border({width:0}).size({width:'0%',height:'1%'})
            }
            Row({space:10}){
              Text('font-style').fontSize(13).border({width:0}).size({width:'24%',height:'18%'})
              Toggle({type:ToggleType.Button, isOn:false}){
                Text('normal').fontSize(13)
              }
              .size({width:'24%',height:'18%'})
              .onChange(()=>{
                this.context.clearRect(0, 10, 1200, 1200);
                this.context.font = 'normal normal 80px sans-serif';
                this.context.fillText("Hello World", 40, 180);
                this.num1 = 1;
                if( this.num1 == 1 && this.num2 == 1 && this.num3 == 1 && this.num4 == 1 && this.num5 == 1
                && this.num6 == 1 && this.num7 == 1 && this.num8 == 1 && this.num9 == 1 && this.num10 == 1
                && this.num11 == 1 && this.num12 == 1 && this.num13 == 1 && this.num14 == 1 && this.num15 == 1
                && this.num16 == 1 && this.num17 == 1 && this.num18 == 1 && this.num19 == 1 && this.num20 == 1
                && this.num21 == 1 && this.num22 == 1 ){
                  this.Vue = true;
                }
              })
              Toggle({type:ToggleType.Button, isOn:false}){
                Text('italic').fontSize(13)
              }
              .size({width:'24%',height:'18%'})
              .onChange(()=>{
                this.context.clearRect(0, 10, 1200, 1200);
                this.context.font = 'italic normal 80px sans-serif';
                this.context.fillText("Hello World", 40, 180);
                this.num2 = 1;
                if( this.num1 == 1 && this.num2 == 1 && this.num3 == 1 && this.num4 == 1 && this.num5 == 1
                && this.num6 == 1 && this.num7 == 1 && this.num8 == 1 && this.num9 == 1 && this.num10 == 1
                && this.num11 == 1 && this.num12 == 1 && this.num13 == 1 && this.num14 == 1 && this.num15 == 1
                && this.num16 == 1 && this.num17 == 1 && this.num18 == 1 && this.num19 == 1 && this.num20 == 1
                && this.num21 == 1 && this.num22 == 1 ){
                  this.Vue = true;
                }
              })
            }
            Row({space:8}) {
              Text('font-weight').fontSize(13).border({ width: 0 }).size({ width: '24%', height: '18%' })
              Toggle({type:ToggleType.Button, isOn:false}){
                Text('normal').fontSize(13)
              }
              .size({width:'16%',height:'18%'})
              .onChange(() => {
                this.context.clearRect(0, 10, 1200, 1200);
                this.context.font = 'normal normal 80px sans-serif';
                this.context.fillText("Hello World", 40, 180);
                this.num3 = 1;
                if( this.num1 == 1 && this.num2 == 1 && this.num3 == 1 && this.num4 == 1 && this.num5 == 1
                && this.num6 == 1 && this.num7 == 1 && this.num8 == 1 && this.num9 == 1 && this.num10 == 1
                && this.num11 == 1 && this.num12 == 1 && this.num13 == 1 && this.num14 == 1 && this.num15 == 1
                && this.num16 == 1 && this.num17 == 1 && this.num18 == 1 && this.num19 == 1 && this.num20 == 1
                && this.num21 == 1 && this.num22 == 1 ){
                  this.Vue = true;
                }
              })
              Toggle({type:ToggleType.Button, isOn:false}){
                Text('bold').fontSize(13)
              }
              .size({width:'16%',height:'18%'})
              .onChange(()=>{
                this.context.clearRect(0, 10, 1200, 1200);
                this.context.font = 'normal bold 80px sans-serif';
                this.context.fillText("Hello World", 40, 180);
                this.num4 = 1;
                if( this.num1 == 1 && this.num2 == 1 && this.num3 == 1 && this.num4 == 1 && this.num5 == 1
                && this.num6 == 1 && this.num7 == 1 && this.num8 == 1 && this.num9 == 1 && this.num10 == 1
                && this.num11 == 1 && this.num12 == 1 && this.num13 == 1 && this.num14 == 1 && this.num15 == 1
                && this.num16 == 1 && this.num17 == 1 && this.num18 == 1 && this.num19 == 1 && this.num20 == 1
                && this.num21 == 1 && this.num22 == 1 ){
                  this.Vue = true;
                }
              })
              Toggle({type:ToggleType.Button, isOn:false}){
                Text('bolder').fontSize(13)
              }
              .size({width:'16%',height:'18%'})
              .onChange(()=>{
                this.context.clearRect(0, 10, 1200, 1200);
                this.context.font = 'normal bolder 80px sans-serif';
                this.context.fillText("Hello World", 40, 180);
                this.num5 = 1;
                if( this.num1 == 1 && this.num2 == 1 && this.num3 == 1 && this.num4 == 1 && this.num5 == 1
                && this.num6 == 1 && this.num7 == 1 && this.num8 == 1 && this.num9 == 1 && this.num10 == 1
                && this.num11 == 1 && this.num12 == 1 && this.num13 == 1 && this.num14 == 1 && this.num15 == 1
                && this.num16 == 1 && this.num17 == 1 && this.num18 == 1 && this.num19 == 1 && this.num20 == 1
                && this.num21 == 1 && this.num22 == 1 ){
                  this.Vue = true;
                }
              })
              Toggle({type:ToggleType.Button, isOn:false}){
                Text('lighter').fontSize(13)
              }
              .size({width:'16%',height:'18%'})
              .onChange(()=>{
                this.context.clearRect(0, 10, 1200, 1200);
                this.context.font = 'normal lighter 80px sans-serif';
                this.context.fillText("Hello World", 40, 180);
                this.num6 = 1;
                if( this.num1 == 1 && this.num2 == 1 && this.num3 == 1 && this.num4 == 1 && this.num5 == 1
                && this.num6 == 1 && this.num7 == 1 && this.num8 == 1 && this.num9 == 1 && this.num10 == 1
                && this.num11 == 1 && this.num12 == 1 && this.num13 == 1 && this.num14 == 1 && this.num15 == 1
                && this.num16 == 1 && this.num17 == 1 && this.num18 == 1 && this.num19 == 1 && this.num20 == 1
                && this.num21 == 1 && this.num22 == 1 ){
                  this.Vue = true;
                }
              })
            }
            Row({space:5}) {
              Toggle({type:ToggleType.Button, isOn:false}){
                Text('100').fontSize(13)
              }
              .size({ width: '10%', height: '18%' })
              .onChange(() => {
                this.context.clearRect(0, 10, 1200, 1200);
                this.context.font = 'normal 100 80px sans-serif';
                this.context.fillText("Hello World", 40, 180);
                this.num7 = 1;
                if( this.num1 == 1 && this.num2 == 1 && this.num3 == 1 && this.num4 == 1 && this.num5 == 1
                && this.num6 == 1 && this.num7 == 1 && this.num8 == 1 && this.num9 == 1 && this.num10 == 1
                && this.num11 == 1 && this.num12 == 1 && this.num13 == 1 && this.num14 == 1 && this.num15 == 1
                && this.num16 == 1 && this.num17 == 1 && this.num18 == 1 && this.num19 == 1 && this.num20 == 1
                && this.num21 == 1 && this.num22 == 1 ){
                  this.Vue = true;
                }
              })
              Toggle({type:ToggleType.Button, isOn:false}){
                Text('200').fontSize(13)
              }
              .size({ width: '10%', height: '18%' })
              .onChange(()=>{
                this.context.clearRect(0, 10, 1200, 1200);
                this.context.font = 'normal 200 80px sans-serif';
                this.context.fillText("Hello World", 40, 180);
                this.num8 = 1;
                if( this.num1 == 1 && this.num2 == 1 && this.num3 == 1 && this.num4 == 1 && this.num5 == 1
                && this.num6 == 1 && this.num7 == 1 && this.num8 == 1 && this.num9 == 1 && this.num10 == 1
                && this.num11 == 1 && this.num12 == 1 && this.num13 == 1 && this.num14 == 1 && this.num15 == 1
                && this.num16 == 1 && this.num17 == 1 && this.num18 == 1 && this.num19 == 1 && this.num20 == 1
                && this.num21 == 1 && this.num22 == 1 ){
                  this.Vue = true;
                }
              })
              Toggle({type:ToggleType.Button, isOn:false}){
                Text('300').fontSize(13)
              }
              .size({ width: '10%', height: '18%' })
              .onChange(()=>{
                this.context.clearRect(0, 10, 1200, 1200);
                this.context.font = 'normal 300 80px sans-serif';
                this.context.fillText("Hello World", 40, 180);
                this.num9 = 1;
                if( this.num1 == 1 && this.num2 == 1 && this.num3 == 1 && this.num4 == 1 && this.num5 == 1
                && this.num6 == 1 && this.num7 == 1 && this.num8 == 1 && this.num9 == 1 && this.num10 == 1
                && this.num11 == 1 && this.num12 == 1 && this.num13 == 1 && this.num14 == 1 && this.num15 == 1
                && this.num16 == 1 && this.num17 == 1 && this.num18 == 1 && this.num19 == 1 && this.num20 == 1
                && this.num21 == 1 && this.num22 == 1 ){
                  this.Vue = true;
                }
              })
              Toggle({type:ToggleType.Button, isOn:false}){
                Text('400').fontSize(13)
              }
              .size({ width: '10%', height: '18%' })
              .onChange(()=>{
                this.context.clearRect(0, 10, 1200, 1200);
                this.context.font = 'normal 400 80px sans-serif';
                this.context.fillText("Hello World", 40, 180);
                this.num10 = 1;
                if( this.num1 == 1 && this.num2 == 1 && this.num3 == 1 && this.num4 == 1 && this.num5 == 1
                && this.num6 == 1 && this.num7 == 1 && this.num8 == 1 && this.num9 == 1 && this.num10 == 1
                && this.num11 == 1 && this.num12 == 1 && this.num13 == 1 && this.num14 == 1 && this.num15 == 1
                && this.num16 == 1 && this.num17 == 1 && this.num18 == 1 && this.num19 == 1 && this.num20 == 1
                && this.num21 == 1 && this.num22 == 1 ){
                  this.Vue = true;
                }
              })
              Toggle({type:ToggleType.Button, isOn:false}){
                Text('500').fontSize(13)
              }
              .size({ width: '10%', height: '18%' })
              .onChange(()=>{
                this.context.clearRect(0, 10, 1200, 1200);
                this.context.font = 'normal 500 80px sans-serif';
                this.context.fillText("Hello World", 40, 180);
                this.num11 = 1;
                if( this.num1 == 1 && this.num2 == 1 && this.num3 == 1 && this.num4 == 1 && this.num5 == 1
                && this.num6 == 1 && this.num7 == 1 && this.num8 == 1 && this.num9 == 1 && this.num10 == 1
                && this.num11 == 1 && this.num12 == 1 && this.num13 == 1 && this.num14 == 1 && this.num15 == 1
                && this.num16 == 1 && this.num17 == 1 && this.num18 == 1 && this.num19 == 1 && this.num20 == 1
                && this.num21 == 1 && this.num22 == 1 ){
                  this.Vue = true;
                }
              })
              Toggle({type:ToggleType.Button, isOn:false}){
                Text('600').fontSize(13)
              }
              .size({ width: '10%', height: '18%' })
              .onChange(()=>{
                this.context.clearRect(0, 10, 1200, 1200);
                this.context.font = 'normal 600 80px sans-serif';
                this.context.fillText("Hello World", 40, 180);
                this.num12 = 1;
                if( this.num1 == 1 && this.num2 == 1 && this.num3 == 1 && this.num4 == 1 && this.num5 == 1
                && this.num6 == 1 && this.num7 == 1 && this.num8 == 1 && this.num9 == 1 && this.num10 == 1
                && this.num11 == 1 && this.num12 == 1 && this.num13 == 1 && this.num14 == 1 && this.num15 == 1
                && this.num16 == 1 && this.num17 == 1 && this.num18 == 1 && this.num19 == 1 && this.num20 == 1
                && this.num21 == 1 && this.num22 == 1 ){
                  this.Vue = true;
                }
              })
              Toggle({type:ToggleType.Button, isOn:false}){
                Text('700').fontSize(13)
              }
              .size({ width: '10%', height: '18%' })
              .onChange(()=>{
                this.context.clearRect(0, 10, 1200, 1200);
                this.context.font = 'normal 700 80px sans-serif';
                this.context.fillText("Hello World", 40, 180);
                this.num13 = 1;
                if( this.num1 == 1 && this.num2 == 1 && this.num3 == 1 && this.num4 == 1 && this.num5 == 1
                && this.num6 == 1 && this.num7 == 1 && this.num8 == 1 && this.num9 == 1 && this.num10 == 1
                && this.num11 == 1 && this.num12 == 1 && this.num13 == 1 && this.num14 == 1 && this.num15 == 1
                && this.num16 == 1 && this.num17 == 1 && this.num18 == 1 && this.num19 == 1 && this.num20 == 1
                && this.num21 == 1 && this.num22 == 1 ){
                  this.Vue = true;
                }
              })
              Toggle({type:ToggleType.Button, isOn:false}){
                Text('800').fontSize(13)
              }
              .size({ width: '10%', height: '18%' })
              .onChange(()=>{
                this.context.clearRect(0, 10, 1200, 1200);
                this.context.font = 'normal 800 80px sans-serif';
                this.context.fillText("Hello World", 40, 180);
                this.num14 = 1;
                if( this.num1 == 1 && this.num2 == 1 && this.num3 == 1 && this.num4 == 1 && this.num5 == 1
                && this.num6 == 1 && this.num7 == 1 && this.num8 == 1 && this.num9 == 1 && this.num10 == 1
                && this.num11 == 1 && this.num12 == 1 && this.num13 == 1 && this.num14 == 1 && this.num15 == 1
                && this.num16 == 1 && this.num17 == 1 && this.num18 == 1 && this.num19 == 1 && this.num20 == 1
                && this.num21 == 1 && this.num22 == 1 ){
                  this.Vue = true;
                }
              })
              Toggle({type:ToggleType.Button, isOn:false}){
                Text('900').fontSize(13)
              }
              .size({ width: '10%', height: '18%' })
              .onChange(()=>{
                this.context.clearRect(0, 10, 1200, 1200);
                this.context.font = 'normal 900 80px sans-serif';
                this.context.fillText("Hello World", 40, 180);
                this.num15 = 1;
                if( this.num1 == 1 && this.num2 == 1 && this.num3 == 1 && this.num4 == 1 && this.num5 == 1
                && this.num6 == 1 && this.num7 == 1 && this.num8 == 1 && this.num9 == 1 && this.num10 == 1
                && this.num11 == 1 && this.num12 == 1 && this.num13 == 1 && this.num14 == 1 && this.num15 == 1
                && this.num16 == 1 && this.num17 == 1 && this.num18 == 1 && this.num19 == 1 && this.num20 == 1
                && this.num21 == 1 && this.num22 == 1 ){
                  this.Vue = true;
                }
              })
            }
            Row({space:10}){
              Text('font-family').fontSize(13).border({width:0}).size({width:'24%',height:'18%'})
              Toggle({type:ToggleType.Button, isOn:false}){
                Text('sans-serif').fontSize(13)
              }
              .size({width:'24%',height:'18%'})
              .onChange(()=>{
                this.context.clearRect(0, 10, 1200, 1200);
                this.context.font = 'normal normal 80px sans-serif';
                this.context.fillText("Hello World", 40, 180);
                this.num16 = 1;
                if( this.num1 == 1 && this.num2 == 1 && this.num3 == 1 && this.num4 == 1 && this.num5 == 1
                && this.num6 == 1 && this.num7 == 1 && this.num8 == 1 && this.num9 == 1 && this.num10 == 1
                && this.num11 == 1 && this.num12 == 1 && this.num13 == 1 && this.num14 == 1 && this.num15 == 1
                && this.num16 == 1 && this.num17 == 1 && this.num18 == 1 && this.num19 == 1 && this.num20 == 1
                && this.num21 == 1 && this.num22 == 1 ){
                  this.Vue = true;
                }
              })
              Toggle({type:ToggleType.Button, isOn:false}){
                Text('serif').fontSize(13)
              }
              .size({width:'24%',height:'18%'})
              .onChange(()=>{
                this.context.clearRect(0, 10, 1200, 1200);
                this.context.font = 'normal normal 80px serif';
                this.context.fillText("Hello World", 40, 180);
                this.num17 = 1;
                if( this.num1 == 1 && this.num2 == 1 && this.num3 == 1 && this.num4 == 1 && this.num5 == 1
                && this.num6 == 1 && this.num7 == 1 && this.num8 == 1 && this.num9 == 1 && this.num10 == 1
                && this.num11 == 1 && this.num12 == 1 && this.num13 == 1 && this.num14 == 1 && this.num15 == 1
                && this.num16 == 1 && this.num17 == 1 && this.num18 == 1 && this.num19 == 1 && this.num20 == 1
                && this.num21 == 1 && this.num22 == 1 ){
                  this.Vue = true;
                }
              })
              Toggle({type:ToggleType.Button, isOn:false}){
                Text('monospace').fontSize(13)
              }
              .size({width:'24%',height:'18%'})
              .onChange(()=>{
                this.context.clearRect(0, 10, 1200, 1200);
                this.context.font = 'normal normal 80px monospace';
                this.context.fillText("Hello World", 40, 180);
                this.num18 = 1;
                if( this.num1 == 1 && this.num2 == 1 && this.num3 == 1 && this.num4 == 1 && this.num5 == 1
                && this.num6 == 1 && this.num7 == 1 && this.num8 == 1 && this.num9 == 1 && this.num10 == 1
                && this.num11 == 1 && this.num12 == 1 && this.num13 == 1 && this.num14 == 1 && this.num15 == 1
                && this.num16 == 1 && this.num17 == 1 && this.num18 == 1 && this.num19 == 1 && this.num20 == 1
                && this.num21 == 1 && this.num22 == 1 ){
                  this.Vue = true;
                }
              })
            }
            Row({space:10}) {
              Text('font-size').fontSize(13).border({ width: 0 }).size({ width: '18%', height: '18%' })
              Toggle({type:ToggleType.Button, isOn:false}){
                Text('small').fontSize(13)
              }
              .size({ width: '18%', height: '18%' })
              .onChange(() => {
                this.context.clearRect(0, 10, 1200, 1200);
                this.context.font = 'normal normal 10px sans-serif';
                this.context.fillText("Hello World", 40, 180);
                this.num19 = 1;
                if( this.num1 == 1 && this.num2 == 1 && this.num3 == 1 && this.num4 == 1 && this.num5 == 1
                && this.num6 == 1 && this.num7 == 1 && this.num8 == 1 && this.num9 == 1 && this.num10 == 1
                && this.num11 == 1 && this.num12 == 1 && this.num13 == 1 && this.num14 == 1 && this.num15 == 1
                && this.num16 == 1 && this.num17 == 1 && this.num18 == 1 && this.num19 == 1 && this.num20 == 1
                && this.num21 == 1 && this.num22 == 1 ){
                  this.Vue = true;
                }
              })
              Toggle({type:ToggleType.Button, isOn:false}){
                Text('medium').fontSize(13)
              }
              .size({ width: '18%', height: '18%' })
              .onChange(()=>{
                this.context.clearRect(0, 10, 1200, 1200);
                this.context.font = 'normal normal 50px sans-serif';
                this.context.fillText("Hello World", 40, 180);
                this.num20 = 1;
                if( this.num1 == 1 && this.num2 == 1 && this.num3 == 1 && this.num4 == 1 && this.num5 == 1
                && this.num6 == 1 && this.num7 == 1 && this.num8 == 1 && this.num9 == 1 && this.num10 == 1
                && this.num11 == 1 && this.num12 == 1 && this.num13 == 1 && this.num14 == 1 && this.num15 == 1
                && this.num16 == 1 && this.num17 == 1 && this.num18 == 1 && this.num19 == 1 && this.num20 == 1
                && this.num21 == 1 && this.num22 == 1 ){
                  this.Vue = true;
                }
              })
              Toggle({type:ToggleType.Button, isOn:false}){
                Text('large').fontSize(13)
              }
              .size({ width: '18%', height: '18%' })
              .onChange(()=>{
                this.context.clearRect(0, 10, 1200, 1200);
                this.context.font = 'normal normal 80px sans-serif';
                this.context.fillText("Hello World", 40, 180);
                this.num21 = 1;
                if( this.num1 == 1 && this.num2 == 1 && this.num3 == 1 && this.num4 == 1 && this.num5 == 1
                && this.num6 == 1 && this.num7 == 1 && this.num8 == 1 && this.num9 == 1 && this.num10 == 1
                && this.num11 == 1 && this.num12 == 1 && this.num13 == 1 && this.num14 == 1 && this.num15 == 1
                && this.num16 == 1 && this.num17 == 1 && this.num18 == 1 && this.num19 == 1 && this.num20 == 1
                && this.num21 == 1 && this.num22 == 1 ){
                  this.Vue = true;
                }
              })
              Toggle({type:ToggleType.Button, isOn:false}){
                Text('extra').fontSize(13)
              }
              .size({ width: '18%', height: '18%' })
              .onChange(()=>{
                this.context.clearRect(0, 10, 1200, 1200);
                this.context.font = 'normal normal 120px sans-serif';
                this.context.fillText("Hello World", 40, 180);
                this.num22 = 1;
                if( this.num1 == 1 && this.num2 == 1 && this.num3 == 1 && this.num4 == 1 && this.num5 == 1
                && this.num6 == 1 && this.num7 == 1 && this.num8 == 1 && this.num9 == 1 && this.num10 == 1
                && this.num11 == 1 && this.num12 == 1 && this.num13 == 1 && this.num14 == 1 && this.num15 == 1
                && this.num16 == 1 && this.num17 == 1 && this.num18 == 1 && this.num19 == 1 && this.num20 == 1
                && this.num21 == 1 && this.num22 == 1 ){
                  this.Vue = true;
                }
              })
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
        Url:'pages/ArkUI/ArkUI_index',
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
