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
struct EnableMultiTypeTest {
  controller: TextController = new TextController();
  mutableStyledString1: MutableStyledString = new MutableStyledString('0123456789', [
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
      styledValue: new DecorationStyle({type: TextDecorationType.LineThrough},{enableMultiType: true})
    },
    {
      start: 5,
      length: 10,
      styledKey: StyledStringKey.DECORATION,
      styledValue: new DecorationStyle({type: TextDecorationType.Overline},{enableMultiType: true})
    },
    {
      start: 7,
      length: 3,
      styledKey: StyledStringKey.DECORATION,
      styledValue: new DecorationStyle({type: TextDecorationType.Underline},{enableMultiType: false})
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
      Row(){
        Button('setStyledString').onClick(()=>{
          this.controller.setStyledString(this.mutableStyledString1)
          let styles = this.mutableStyledString1.getStyles(0, this.mutableStyledString1.length);
          if (styles.length !== 0) {
            for (let i = 0; i < styles.length; i++) {
              if (styles[i].styledKey === 1) {
                let decorationStyleAttr = styles[i].styledValue as DecorationStyle;
                console.info('setStyledString decorationStyleAttr'+i+' thicknessScale:' + decorationStyleAttr.thicknessScale);
                console.info('setStyledString decorationStyleAttr'+i+' options:' + decorationStyleAttr.options?.enableMultiType);
                AppStorage.SetOrCreate('StyledStringEnableMultiType'+i,decorationStyleAttr.options?.enableMultiType)
              }
            }
          }
        }).id('setStyledStringEnableMultiType')
      }.height('10%')
    }
  }
}