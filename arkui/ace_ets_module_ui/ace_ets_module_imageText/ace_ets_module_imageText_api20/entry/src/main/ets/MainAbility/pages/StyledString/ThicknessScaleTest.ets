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
import { LengthMetrics } from '@kit.ArkUI';

@Entry
@Component
struct ThicknessScaleTest {
  controller: TextController = new TextController();
  mutableStyledString1: MutableStyledString = new MutableStyledString('不设置thicknessScale', [
    {
      start: 0,
      length: 10,
      styledKey: StyledStringKey.FONT,
      styledValue: new TextStyle({ fontColor: Color.Orange, fontSize: LengthMetrics.vp(10) })
    },
    {
      start: 0,
      length: 10,
      styledKey: StyledStringKey.DECORATION,
      styledValue: new DecorationStyle({type: TextDecorationType.LineThrough})
    },
  ]);
  mutableStyledString2: MutableStyledString = new MutableStyledString('设置thicknessScale：2', [
    {
      start: 0,
      length: 10,
      styledKey: StyledStringKey.FONT,
      styledValue: new TextStyle({ fontColor: Color.Orange, fontSize: LengthMetrics.vp(10) })
    },
    {
      start: 0,
      length: 7,
      styledKey: StyledStringKey.DECORATION,
      styledValue: new DecorationStyle({type: TextDecorationType.LineThrough,thicknessScale:2 })
    },
  ]);
  mutableStyledString3: MutableStyledString = new MutableStyledString('设置thicknessScale：0', [
    {
      start: 0,
      length: 10,
      styledKey: StyledStringKey.FONT,
      styledValue: new TextStyle({ fontColor: Color.Orange, fontSize: LengthMetrics.vp(10) })
    },
    {
      start: 0,
      length: 7,
      styledKey: StyledStringKey.DECORATION,
      styledValue: new DecorationStyle({type: TextDecorationType.LineThrough,thicknessScale: 0 })
    },
  ]);
  mutableStyledString4: MutableStyledString = new MutableStyledString('设置thicknessScale：undefined', [
    {
      start: 0,
      length: 10,
      styledKey: StyledStringKey.FONT,
      styledValue: new TextStyle({ fontColor: Color.Orange, fontSize: LengthMetrics.vp(10) })
    },
    {
      start: 0,
      length: 7,
      styledKey: StyledStringKey.DECORATION,
      styledValue: new DecorationStyle({type: TextDecorationType.LineThrough,thicknessScale: undefined })
    },
  ]);
  build() {
    Column() {
      Text('这是测试文本',{controller:this.controller})
        .decoration({
          type:TextDecorationType.LineThrough,
          color:Color.Red,
          style:TextDecorationStyle.DOTTED,
          thicknessScale:1
        })
        .id('thicknessScaleTest')
      Row(){
        Button('setStyledString1').onClick(()=>{
          this.controller.setStyledString(this.mutableStyledString1)
          let styles = this.mutableStyledString1.getStyles(0, this.mutableStyledString1.length);
          if (styles.length !== 0) {
            for (let i = 0; i < styles.length; i++) {
              if (styles[i].styledKey === 1) {
                let decorationStyleAttr = styles[i].styledValue as DecorationStyle;
                console.info('setStyledString1 decorationStyleAttr'+i+' thicknessScale:' + decorationStyleAttr.thicknessScale);
                console.info('setStyledString1 decorationStyleAttr'+i+' options:' + decorationStyleAttr.options?.enableMultiType);
                AppStorage.SetOrCreate('StyledString1ThicknessScale',decorationStyleAttr.thicknessScale)
              }
            }
          }
        }).id('setStyledString1')
        Button('setStyledString2').onClick(()=>{
          this.controller.setStyledString(this.mutableStyledString2)
          let styles = this.mutableStyledString2.getStyles(0, this.mutableStyledString2.length);
          if (styles.length !== 0) {
            for (let i = 0; i < styles.length; i++) {
              if (styles[i].styledKey === 1) {
                let decorationStyleAttr = styles[i].styledValue as DecorationStyle;
                console.info('setStyledString2 decorationStyleAttr'+i+' thicknessScale:' + decorationStyleAttr.thicknessScale);
                console.info('setStyledString2 decorationStyleAttr'+i+' options:' + decorationStyleAttr.options?.enableMultiType);
                AppStorage.SetOrCreate('StyledString2ThicknessScale',decorationStyleAttr.thicknessScale)
              }
            }
          }
        }).id('setStyledString2')
      }.height('10%')
      Row(){
        Button('setStyledString3').onClick(()=>{
          this.controller.setStyledString(this.mutableStyledString3)
          let styles = this.mutableStyledString3.getStyles(0, this.mutableStyledString3.length);
          if (styles.length !== 0) {
            for (let i = 0; i < styles.length; i++) {
              if (styles[i].styledKey === 1) {
                let decorationStyleAttr = styles[i].styledValue as DecorationStyle;
                console.info('setStyledString3 decorationStyleAttr'+i+' thicknessScale:' + decorationStyleAttr.thicknessScale);
                console.info('setStyledString3 decorationStyleAttr'+i+' options:' + decorationStyleAttr.options?.enableMultiType);
                AppStorage.SetOrCreate('StyledString3ThicknessScale',decorationStyleAttr.thicknessScale)
              }
            }
          }
        }).id('setStyledString3')
        Button('setStyledString4').onClick(()=>{
          this.controller.setStyledString(this.mutableStyledString4)
          let styles = this.mutableStyledString4.getStyles(0, this.mutableStyledString4.length);
          if (styles.length !== 0) {
            for (let i = 0; i < styles.length; i++) {
              if (styles[i].styledKey === 1) {
                let decorationStyleAttr = styles[i].styledValue as DecorationStyle;
                console.info('setStyledString4 decorationStyleAttr'+i+' thicknessScale:' + decorationStyleAttr.thicknessScale);
                console.info('setStyledString4 decorationStyleAttr'+i+' options:' + decorationStyleAttr.options?.enableMultiType);
                AppStorage.SetOrCreate('StyledString4ThicknessScale',decorationStyleAttr.thicknessScale)
              }
            }
          }
        }).id('setStyledString4')
      }.height('10%')
    }
  }
}