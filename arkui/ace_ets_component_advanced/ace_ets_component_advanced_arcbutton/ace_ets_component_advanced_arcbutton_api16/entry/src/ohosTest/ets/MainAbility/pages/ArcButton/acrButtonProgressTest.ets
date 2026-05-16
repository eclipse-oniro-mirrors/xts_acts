/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { ColorMetrics, LengthMetrics, LengthUnit } from '@ohos.arkui.node';
import { ArcButton, ArcButtonOptions, ArcButtonPosition, ArcButtonStyleMode } from '@ohos.arkui.advanced.ArcButton';
@Entry
@ComponentV2
struct arcButtonProgressText {
  @Local topOptionsTopEdge: ArcButtonOptions = new ArcButtonOptions({});
  @Local topOptionsBottomEdge: ArcButtonOptions = new ArcButtonOptions({});
  @Local bottomOptions: ArcButtonOptions = new ArcButtonOptions({});
  @Local progressNoTotalOptions: ArcButtonOptions = new ArcButtonOptions({});
  @Local progressNoColorOptions: ArcButtonOptions = new ArcButtonOptions({});
  @Local progressValue: number = 0;
 
  @Local testClickButton: string = "ClickButtonToAdd： "
  @Local testTouchButton: string = "TouchButtonToAdd： "
 
  @Local curWidth : number = 300;
 
  private valueArray: Array<number> = new Array(
    -1,
    0,
    100,
    101
  )
  @Local valueArrayIndex: number = 0;
 
  private totalArray: Array<number | undefined> = new Array(
    100,
    -1,
    0,
    2147483647,
    2147483648,
    undefined
  )
 
  @Local totalArrayIndex: number = 0;
 
  private colorArray: Array<ResourceColor | undefined> = new Array<ResourceColor | undefined>(
    0xdf3737,
    0x666666,
    Color.White,
    undefined,
    "#ad4685",
  )
  @Local colorArrayIndex: number = 0;
 
  private arcButtonStyleModeArray:Array<ArcButtonStyleMode> = new Array<ArcButtonStyleMode>(
    ArcButtonStyleMode.EMPHASIZED_LIGHT,
    ArcButtonStyleMode.EMPHASIZED_DARK,
    ArcButtonStyleMode.NORMAL_LIGHT,
    ArcButtonStyleMode.NORMAL_DARK,
    ArcButtonStyleMode.CUSTOM,
  )
  private arcButtonStyleModeArrayLabel: Array<string> = new Array<string>(
    "ArcButtonStyleMode.EMPHASIZED_LIGHT",
    "ArcButtonStyleMode.EMPHASIZED_DARK",
    "ArcButtonStyleMode.NORMAL_LIGHT",
    "ArcButtonStyleMode.NORMAL_DARK",
    "ArcButtonStyleMode.CUSTOM",
  )
  @Local arcButtonStyleModeArrayIndex: number = 0;
  @Local internationalArrayIndex: number = 0;
 
  aboutToAppear() {
 
 
    this.bottomOptions = new ArcButtonOptions({
      label: "Test Progress",
      //强调灯光
      styleMode: ArcButtonStyleMode.CUSTOM,
      // backgroundColor: ColorMetrics.numeric(0xdf3737),
      fontColor: ColorMetrics.numeric(0xffffff),
      //弧形按钮文本大小。
      fontSize: new LengthMetrics(10, LengthUnit.FP),
      shadowEnabled: true,
      fontFamily: 'Bold',
      progressConfig: {value: -1, total:100, color: 0x333333},
      //弧形按钮字体名。
      onClick: () => {
        this.testClickButton += " Progress1"
      },
      onTouch: () => {
        this.testClickButton += " Progress1"
      },
    })
 
    this.progressNoTotalOptions = new ArcButtonOptions({
      label: "Button no total setting",
      //强调灯光
      styleMode: ArcButtonStyleMode.CUSTOM,
      backgroundColor: ColorMetrics.numeric(0xdf3737),
      fontColor: ColorMetrics.numeric(0xffffff),
      position:ArcButtonPosition.TOP_EDGE,
      //弧形按钮文本大小。
      fontSize: new LengthMetrics(10, LengthUnit.FP),
      shadowEnabled: true,
      fontFamily: 'Bold',
      progressConfig: {value: 20, color:0x666666},
      //弧形按钮字体名。
      onClick: () => {
        this.testClickButton += " Progress2"
      },
      onTouch: () => {
        this.testClickButton += " Progress2"
      },
    })
 
    this.progressNoColorOptions = new ArcButtonOptions({label: "Button no color setting",
      //强调灯光
      styleMode: ArcButtonStyleMode.CUSTOM,
      backgroundColor: ColorMetrics.numeric(0xdf3737),
      fontColor: ColorMetrics.numeric(0xffffff),
      //弧形按钮文本大小。
      fontSize: new LengthMetrics(10, LengthUnit.FP),
      shadowEnabled: true,
      fontFamily: 'Bold',
      progressConfig: {value: 20, total:50},
      //弧形按钮字体名。
      onClick: () => {
        this.testClickButton += " Progress3"
      },
      onTouch: () => {
        this.testClickButton += " Progress3"
      },
    })
  }
 
 
  build() {
    Column() {
      Flex(){
        Button("Set All ArcButtonStyleMode").onClick(() => {
          if(this.arcButtonStyleModeArrayIndex >= this.arcButtonStyleModeArray.length -1) {
            this.arcButtonStyleModeArrayIndex = 0;
          } else {
            this.arcButtonStyleModeArrayIndex = this.arcButtonStyleModeArrayIndex + 1;
          }
          this.bottomOptions.styleMode = this.arcButtonStyleModeArray[this.arcButtonStyleModeArrayIndex];
          this.progressNoTotalOptions.styleMode = this.arcButtonStyleModeArray[this.arcButtonStyleModeArrayIndex];
          this.progressNoColorOptions.styleMode = this.arcButtonStyleModeArray[this.arcButtonStyleModeArrayIndex];
        })
          .height(20)
      }
      Scroll() {
        Column() {
          Text('注：StyleMode 对 Progress 类型的按钮背景应该不生效').fontSize(10).fontColor(0xdf3737).width('90%')
 
          Text('Test onclick ->' + this.testClickButton).fontSize(10).fontColor(0xcccccc).width('90%')
          Text('Test onTouch ->' + this.testClickButton).fontSize(10).fontColor(0xcccccc).width('90%')
          Text('ArcButtonStyleMode: ' + this.arcButtonStyleModeArrayLabel[this.arcButtonStyleModeArrayIndex]).fontSize(10).fontColor(0xcccccc).width('90%')
        }
      }.height(10)
      Flex() {
        Button("set value").onClick(() => {
          if(this.valueArrayIndex >= this.valueArray.length -1) {
            this.valueArrayIndex = 0;
          } else {
            this.valueArrayIndex = this.valueArrayIndex + 1;
          }
          if(this.bottomOptions.progressConfig != undefined) {
            this.bottomOptions.progressConfig.value = this.valueArray[this.valueArrayIndex];
          }
        })
          .height(20)
          .id('setValue')
        Button("set total").onClick(() => {
          if(this.totalArrayIndex >= this.totalArray.length -1) {
            this.totalArrayIndex = 0;
          } else {
            this.totalArrayIndex = this.totalArrayIndex + 1;
          }
          if(this.bottomOptions.progressConfig) {
            this.bottomOptions.progressConfig.total = this.totalArray[this.totalArrayIndex];
          }
        })
          .height(20)
          .id('setTotal')
      }
      Column() {
        Button("set color").onClick(() => {
          if(this.colorArrayIndex >= this.colorArray.length -1) {
            this.colorArrayIndex = 0;
          } else {
            this.colorArrayIndex = this.colorArrayIndex + 1;
          }
          if(this.bottomOptions.progressConfig) {
            this.bottomOptions.progressConfig.color = this.colorArray[this.colorArrayIndex];
          }
          if(this.progressNoTotalOptions.progressConfig) {
            this.progressNoTotalOptions.progressConfig.color = this.colorArray[this.colorArrayIndex]
          }
        })
          .height(20)
          .id('setColor')
      }
      Column() {
        Text('Top button value:' + this.bottomOptions.progressConfig?.value).fontSize(10).fontColor(0xcccccc).width('90%').key('progressValue')
        Text('Top button total:' + this.bottomOptions.progressConfig?.total).fontSize(10).fontColor(0xcccccc).width('90%').key('progressTotal')
        Text('Top button color:' + this.bottomOptions.progressConfig?.color).fontSize(10).fontColor(0xcccccc).width('90%').key('progressColor')
        Text('注：这个组件不设置背景色，因此在Color为Undefined时表现为默认进度条颜色').fontSize(10).fontColor(0xdf3737).width('90%')
        ArcButton({ options: this.bottomOptions })
 
        Text('Top button value:' + this.progressNoTotalOptions.progressConfig?.value).fontSize(10).fontColor(0xcccccc).width('90%')
        Text('Top button total:' + this.progressNoTotalOptions.progressConfig?.total).fontSize(10).fontColor(0xcccccc).width('90%')
        Text('Top button color:' + this.progressNoTotalOptions.progressConfig?.color).fontSize(10).fontColor(0xcccccc).width('90%')
        Text('注：这个组件设置了背景色，因此在Color存在时取Color值，Color为Undefined时取背景色').fontSize(10).fontColor(0xdf3737).width('90%')
        ArcButton({ options: this.progressNoTotalOptions })
 
        Text('Top button value:' + this.progressNoColorOptions.progressConfig?.value).fontSize(10).fontColor(0xcccccc).width('90%')
        Text('Top button total:' + this.progressNoColorOptions.progressConfig?.total).fontSize(10).fontColor(0xcccccc).width('90%')
        Text('Top button color:' + this.progressNoColorOptions.progressConfig?.color).fontSize(10).fontColor(0xcccccc).width('90%')
        Text('注：这个组件设置了背景色，因此在Color没设置时使用组件背景色计算').fontSize(10).fontColor(0xdf3737).width('90%')
        ArcButton({ options: this.progressNoColorOptions })
      }
    }.height('100%')
  }
}