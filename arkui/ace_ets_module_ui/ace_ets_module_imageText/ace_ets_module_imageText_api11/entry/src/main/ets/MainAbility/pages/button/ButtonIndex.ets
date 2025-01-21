/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import events_emitter from '@ohos.events.emitter';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import hilog from '@ohos.hilog';
// import testsuite from '../../../test/List.test'
@Entry
@Component
struct textInputTest {
  aboutToAppear(){
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
    // Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
  }
  @State txtA: string = 'overflowTextOverlengthTextOverflow.Clip';
  @State txtB: string = 'overflowTextOverlengthTextOverflow.Ellipsis';
  @State txtC: string = 'overflowTextOverlengthTextOverflow.None';
  @State txtD: string = 'overflowTextOverflow.Race';
  @State txtE: string = 'overflowTextOverflow.MultilineClip';
  @State txtF: string = 'overflowTextOverflow.MultilineEllipsis';
  @State txtG: string = 'overflowTextOverlengthTextOverflow.Clip';
  @State txtH: string = 'overflowTextOverlengthTextOverflow.Clip';
  @State txtI: string = 'overflowTextOverlengthTextOverflow.Clip';
  @State txtJ: string = 'overflowTextOverlengthTextOverflow.Clip';
  @State txtK: string = 'overfloTextOverlengthTextOverflow.Clip';
  @State txtL: string = 'overflowTextOverlengthTextOverflow.Clip';
  @State txtM: string = 'overflowTextOverlengthTextOverflow.Clip';
  @State txtN: string = 'overflowTextOverlengthTextOverflow.Clip';
  @State txtO: string = 'overflowTextOverlengthTextOverflow.Clip';
  @State txtP: string = 'overflowTextOverlengthTextOverflow.Clipe';
  @State txtQ: string = 'overflowTextOverlengthTextOverflow.Clip';
  @State txtR: string = 'overflowTextOverlengthTextOverflow.Clip';
  @State txtS: string = 'overflowTextOverlengthTextOverflow.Clip';
  @State txtT: string = 'overflowTextOverlengthTextOverflow.Clipe';
  @State txtU: string = 'overflowTextOverlengthTextOverflow.Clip';
  @State txtV: string = 'overflowTextOverlengthTextOverflow.Clip';
  @State txtW: string = 'overflowTextOverlengthTextOverflow.Clip';
  @State txtX: string = 'overflowTextOverlengthTextOverflow.Clip';
  @State txtY: string = 'overflowTextOverlengthTextOverflow.Clip';
  @State txtZ: string = 'overflowTextOverlengthTextOverflow.Clip';
  @State txta: string = 'overflowTextOverlengthTextOverflow.Clip';
  @State txtb: string = 'overflowTextOverlengthTextOverflow.Clip';
  @State txtc: string = 'overflowTextOverlength TextOverflow.Clip';
  @State txtd: string = 'overflowTextOverlength TextOverflow.Clip';
  @State widthLongSize: number = 300;
  @State widthShortSize: number = 200;
  @State colorInfo: string = "#f2eada";
  private scroller: Scroller = new Scroller()
  build() {
    Column() {
      Stack({ alignContent: Alignment.End }) {
        Scroll(this.scroller) {
          Flex({ direction: FlexDirection.Column }) {

            Text('ArkUX_Stage_Button_LabelStyle_0100').fontSize(15).margin({top:20})
            Button(this.txtA)
              .width(this.widthShortSize)
              .labelStyle({ overflow: TextOverflow.Clip,
                maxLines: 1, minFontSize: 5,
                heightAdaptivePolicy: TextHeightAdaptivePolicy.MAX_LINES_FIRST,
                font: { size: 15, weight: FontWeight.Bolder, family: 'cursive', style: FontStyle.Italic }
              })
              .key("ArkUX_Stage_Button_LabelStyle_0100")

            Text('ArkUX_Stage_Button_LabelStyle_0200').fontSize(15).margin({top:20})
            Button(this.txtB)
              .width(this.widthShortSize)
              .labelStyle({ overflow: TextOverflow.Clip,
                maxLines: 3, minFontSize: 5,
                heightAdaptivePolicy:TextHeightAdaptivePolicy.MAX_LINES_FIRST,
                font: { size: 15, weight: FontWeight.Bolder, family: 'cursive', style: FontStyle.Italic } })
              .key("ArkUX_Stage_Button_LabelStyle_0200")

            Text('ArkUX_Stage_Button_LabelStyle_0300').fontSize(15).margin({top:20})
            Button(this.txtC)
              .width(this.widthShortSize)
              .labelStyle({ overflow: TextOverflow.Clip,
                maxLines: 1, minFontSize: 5,
                heightAdaptivePolicy:TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST,
                font: { size: 15, weight: FontWeight.Bolder, family: 'cursive', style: FontStyle.Italic } })
              .key("ArkUX_Stage_Button_LabelStyle_0300")

            Text('ArkUX_Stage_Button_LabelStyle_0400').fontSize(15).margin({top:20})
            Button(this.txtD)
              .width(this.widthShortSize)
              .labelStyle({ overflow: TextOverflow.Clip,
                maxLines: 1, minFontSize: 5,
                heightAdaptivePolicy:TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST,
                font: { weight: FontWeight.Bolder, family: 'cursive', style: FontStyle.Normal } })
              .key("ArkUX_Stage_Button_LabelStyle_0400")

            Text('ArkUX_Stage_Button_LabelStyle_0500').fontSize(15).margin({top:20})
            Button(this.txtE)
              .width(this.widthShortSize)
              .labelStyle({ overflow: TextOverflow.Clip,
                maxLines: 3, minFontSize: 5,
                heightAdaptivePolicy:TextHeightAdaptivePolicy.LAYOUT_CONSTRAINT_FIRST,
                font: { size: 15, weight: FontWeight.Bolder, family: 'cursive', style: FontStyle.Italic } })
              .key("ArkUX_Stage_Button_LabelStyle_0500")

            Text('ArkUX_Stage_Button_LabelStyle_0600').fontSize(15).margin({top:20})
            Button(this.txtF)
              .width(this.widthShortSize)
              .labelStyle({ overflow: TextOverflow.Ellipsis,
                maxLines: 1, minFontSize: 5,
                heightAdaptivePolicy:TextHeightAdaptivePolicy.MAX_LINES_FIRST,
                font: { size: 15, weight: FontWeight.Bolder, family: 'cursive', style: FontStyle.Italic } })
              .key("ArkUX_Stage_Button_LabelStyle_0600")

            Text('ArkUX_Stage_Button_LabelStyle_0700').fontSize(15).margin({top:20})
            Button(this.txtG)
              .width(this.widthShortSize)
              .labelStyle({ overflow: TextOverflow.Ellipsis,
                maxLines: 3, minFontSize: 5,
                heightAdaptivePolicy:TextHeightAdaptivePolicy.MAX_LINES_FIRST,
                font: { size: 15, weight: FontWeight.Bolder, family: 'cursive', style: FontStyle.Italic } })
              .key("ArkUX_Stage_Button_LabelStyle_0700")

            Text('ArkUX_Stage_Button_LabelStyle_0800').fontSize(15).margin({top:20})
            Button(this.txtH)
              .width(this.widthShortSize)
              .labelStyle({ overflow: TextOverflow.Ellipsis,
                maxLines: 1, minFontSize: 5,
                heightAdaptivePolicy:TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST,
                font: { size: 15, weight: FontWeight.Bolder, family: 'cursive', style: FontStyle.Italic } })
              .key("ArkUX_Stage_Button_LabelStyle_0800")

            Text('ArkUX_Stage_Button_LabelStyle_0900').fontSize(15).margin({top:20})
            Button(this.txtI)
              .width(this.widthShortSize)
              .labelStyle({ overflow: TextOverflow.Ellipsis,
                maxLines: 1, minFontSize: 5,
                heightAdaptivePolicy:TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST,
                font: { weight: FontWeight.Bolder, family: 'cursive', style: FontStyle.Normal } })
              .key("ArkUX_Stage_Button_LabelStyle_0900")

            Text('ArkUX_Stage_Button_LabelStyle_1000').fontSize(15).margin({top:20})
            Button(this.txtJ)
              .width(this.widthShortSize)
              .labelStyle({ overflow: TextOverflow.Ellipsis,
                maxLines: 3, minFontSize: 5,
                heightAdaptivePolicy:TextHeightAdaptivePolicy.LAYOUT_CONSTRAINT_FIRST,
                font: { size: 15, weight: FontWeight.Bolder, family: 'cursive', style: FontStyle.Italic } })
              .key("ArkUX_Stage_Button_LabelStyle_1000")

            Text('ArkUX_Stage_Button_LabelStyle_1100').fontSize(15).margin({top:20})
            Button(this.txtK)
              .width(this.widthShortSize)
              .labelStyle({ overflow: TextOverflow.None,
                maxLines: 1, minFontSize: 5,
                heightAdaptivePolicy:TextHeightAdaptivePolicy.MAX_LINES_FIRST,
                font: { size: 15, weight: FontWeight.Bolder, family: 'cursive', style: FontStyle.Italic } })
              .key("ArkUX_Stage_Button_LabelStyle_1100")

            Text('ArkUX_Stage_Button_LabelStyle_1200').fontSize(15).margin({top:20})
            Button(this.txtL)
              .width(this.widthShortSize)
              .labelStyle({ overflow: TextOverflow.None,
                maxLines: 3, minFontSize: 5,
                heightAdaptivePolicy:TextHeightAdaptivePolicy.MAX_LINES_FIRST,
                font: { size: 15, weight: FontWeight.Bolder, family: 'cursive', style: FontStyle.Italic } })
              .key("ArkUX_Stage_Button_LabelStyle_1200")

            Text('ArkUX_Stage_Button_LabelStyle_1300').fontSize(15).margin({top:20})
            Button(this.txtM)
              .width(this.widthShortSize)
              .labelStyle({ overflow: TextOverflow.None,
                maxLines: 1, minFontSize: 5,
                heightAdaptivePolicy:TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST,
                font: { size: 15, weight: FontWeight.Bolder, family: 'cursive', style: FontStyle.Italic } })
              .key("ArkUX_Stage_Button_LabelStyle_1300")

            Text('ArkUX_Stage_Button_LabelStyle_1400').fontSize(15).margin({top:20})
            Button(this.txtN)
              .width(this.widthShortSize)
              .labelStyle({ overflow: TextOverflow.None,
                maxLines: 1, minFontSize: 5,
                heightAdaptivePolicy:TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST,
                font: { weight: FontWeight.Bolder, family: 'cursive', style: FontStyle.Normal } })
              .key("ArkUX_Stage_Button_LabelStyle_1400")

            Text('ArkUX_Stage_Button_LabelStyle_1500').fontSize(15).margin({top:20})
            Button(this.txtO)
              .width(this.widthShortSize)
              .labelStyle({ overflow: TextOverflow.None,
                maxLines: 3, minFontSize: 5,
                heightAdaptivePolicy:TextHeightAdaptivePolicy.LAYOUT_CONSTRAINT_FIRST,
                font: { size: 15, weight: FontWeight.Bolder, family: 'cursive', style: FontStyle.Italic } })
              .key("ArkUX_Stage_Button_LabelStyle_1500")

            Text('ArkUX_Stage_Button_LabelStyle_1600').fontSize(15).margin({top:20})
            Button(this.txtP)
              .width(this.widthShortSize)
              .labelStyle({ overflow: TextOverflow.Ellipsis,
                maxLines: 1 })
              .key("ArkUX_Stage_Button_LabelStyle_1600")

            Text('ArkUX_Stage_Button_LabelStyle_1700').fontSize(15).margin({top:20})
            Button(this.txtQ)
              .width(this.widthShortSize)
              .labelStyle({ overflow: TextOverflow.Ellipsis,
                minFontSize: 5 })
              .key("ArkUX_Stage_Button_LabelStyle_1700")

            Text('ArkUX_Stage_Button_LabelStyle_1800').fontSize(15).margin({top:20})
            Button(this.txtR)
              .width(this.widthShortSize)
              .labelStyle({ overflow: TextOverflow.Ellipsis,
                heightAdaptivePolicy:TextHeightAdaptivePolicy.MAX_LINES_FIRST
              })
              .key("ArkUX_Stage_Button_LabelStyle_1800")

            Text('ArkUX_Stage_Button_LabelStyle_1900').fontSize(15).margin({top:20})
            Button(this.txtS)
              .width(this.widthShortSize)
              .labelStyle({ overflow: TextOverflow.Ellipsis,
                font: { size: 15, weight: FontWeight.Medium, family: 'cursive', style: FontStyle.Italic } })
              .key("ArkUX_Stage_Button_LabelStyle_1900")

            Text('ArkUX_Stage_Button_LabelStyle_2000').fontSize(15).margin({top:20})
            Button(this.txtT)
              .width(this.widthShortSize)
              .labelStyle({ overflow: TextOverflow.Ellipsis })
              .key("ArkUX_Stage_Button_LabelStyle_2000")

            Text('ArkUX_Stage_Button_LabelStyle_2100').fontSize(15).margin({top:20})
            Button(this.txtU)
              .width(this.widthShortSize)
              .labelStyle({ maxLines: 1, minFontSize: 5,
                heightAdaptivePolicy:TextHeightAdaptivePolicy.MAX_LINES_FIRST,
                font: { size: 15, weight: FontWeight.Bolder, family: 'cursive', style: FontStyle.Italic } })
              .key("ArkUX_Stage_Button_LabelStyle_2100")

            Text('ArkUX_Stage_Button_LabelStyle_2200').fontSize(15).margin({top:20})
            Button(this.txtV)
              .width(this.widthShortSize)
              .key("ArkUX_Stage_Button_LabelStyle_2200")

            Text('ArkUX_Stage_Button_LabelStyle_2300').fontSize(15).margin({top:20})
            Button(this.txtW)
              .width(this.widthLongSize)
              .labelStyle({ overflow: TextOverflow.Clip,
                maxLines: 1, minFontSize: 5,
                heightAdaptivePolicy:TextHeightAdaptivePolicy.MAX_LINES_FIRST,
                font: { size: 15, weight: FontWeight.Bolder, family: 'cursive', style: FontStyle.Italic } })
              .key("ArkUX_Stage_Button_LabelStyle_2300")

            Text('ArkUX_Stage_Button_LabelStyle_2400').fontSize(15).margin({top:20})
            Button(this.txtX)
              .width(this.widthLongSize)
              .labelStyle({ overflow: TextOverflow.Ellipsis,
                maxLines: 1, minFontSize: 5,
                heightAdaptivePolicy:TextHeightAdaptivePolicy.MAX_LINES_FIRST,
                font: { size: 15, weight: FontWeight.Bolder, family: 'cursive', style: FontStyle.Italic } })
              .key("ArkUX_Stage_Button_LabelStyle_2400")

            Text('ArkUX_Stage_Button_LabelStyle_2500').fontSize(15).margin({top:20})
            Button(this.txtY)
              .width(this.widthLongSize)
              .labelStyle({ overflow: TextOverflow.None,
                maxLines: 1, minFontSize: 5,
                heightAdaptivePolicy:TextHeightAdaptivePolicy.MAX_LINES_FIRST,
                font: { size: 15, weight: FontWeight.Bolder, family: 'cursive', style: FontStyle.Italic } })
              .key("ArkUX_Stage_Button_LabelStyle_2500")

            Text('ArkUX_Stage_Button_LabelStyle_2600').fontSize(15).margin({top:20})
            Button(this.txtZ)
              .width(this.widthLongSize)
              .key("ArkUX_Stage_Button_LabelStyle_2600")

            Text('ArkUX_Stage_Button_LabelStyle_2700').fontSize(15).margin({top:20})
            Button(this.txta)
              .width(this.widthShortSize)
              .labelStyle({ overflow: null,
                maxLines: 1, minFontSize: 5,
                heightAdaptivePolicy:TextHeightAdaptivePolicy.MAX_LINES_FIRST,
                font: { size: 15, weight: FontWeight.Bolder, family: 'cursive', style: FontStyle.Italic } })
              .key("ArkUX_Stage_Button_LabelStyle_2700")

            Text('ArkUX_Stage_Button_LabelStyle_2800').fontSize(15).margin({top:20})
            Button(this.txtb)
              .width(this.widthShortSize)
              .labelStyle({ overflow: 0,
                maxLines: 1, minFontSize: 5,
                heightAdaptivePolicy:TextHeightAdaptivePolicy.MAX_LINES_FIRST,
                font: { size: 15, weight: FontWeight.Bolder, family: 'cursive', style: FontStyle.Italic } })
              .key("ArkUX_Stage_Button_LabelStyle_2800")

            Text('ArkUX_Stage_Button_LabelStyle_2900').fontSize(15).margin({top:20})
            Button(this.txtc,{ type: ButtonType.Capsule, stateEffect: false }).opacity(0.4)
              .width(this.widthShortSize)
              .labelStyle({ overflow: TextOverflow.Clip,
                maxLines: 1, minFontSize: 5,
                heightAdaptivePolicy:TextHeightAdaptivePolicy.MAX_LINES_FIRST,
                font: { size: 15, weight: FontWeight.Bolder, family: 'cursive', style: FontStyle.Italic } })
              .key("ArkUX_Stage_Button_LabelStyle_2900")

            Text('ArkUX_Stage_Button_LabelStyle_3000').fontSize(15).margin({top:20})
            Button(this.txtd)
              .width(this.widthShortSize)
              .labelStyle({ overflow: TextOverflow.Ellipsis,
                maxLines: 1, minFontSize: 5,
                heightAdaptivePolicy:TextHeightAdaptivePolicy.MAX_LINES_FIRST,
                font: { size: 15, weight: FontWeight.Bolder, family: 'cursive', style: FontStyle.Italic } })
              .key("ArkUX_Stage_Button_LabelStyle_3000")
          }
        }
        .scrollBar(BarState.Off)
        .scrollable(ScrollDirection.Vertical)
        ScrollBar({ scroller: this.scroller, direction: ScrollBarDirection.Vertical, state: BarState.Auto })
      }
    }
    .width('100%')
  }
}
