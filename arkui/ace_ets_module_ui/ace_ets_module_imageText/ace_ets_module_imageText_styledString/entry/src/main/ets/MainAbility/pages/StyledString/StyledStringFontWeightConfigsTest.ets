/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct styledStringFontWeightConfigsTest {
  fontStyleAttr0: TextStyle = new TextStyle({ fontColor: Color.Red });
  fontStyleAttr1: TextStyle = new TextStyle({ fontColor: Color.Orange ,fontConfigs:undefined});
  fontStyleAttr2: TextStyle = new TextStyle({ fontColor: Color.Yellow ,fontConfigs:{fontWeightConfigs:undefined}});
  fontStyleAttr3: TextStyle = new TextStyle({ 
    fontColor: Color.Green ,fontConfigs:{fontWeightConfigs:{enableVariableFontWeight:undefined,enableDeviceFontWeightCategory:undefined}}
  });
  fontStyleAttr4: TextStyle = new TextStyle({ 
    fontColor: Color.Pink ,fontConfigs:{fontWeightConfigs:{enableVariableFontWeight:true,enableDeviceFontWeightCategory:true}}
  });
  fontStyleAttr5: TextStyle = new TextStyle({ 
    fontColor: Color.Blue ,fontConfigs:{fontWeightConfigs:{enableVariableFontWeight:false,enableDeviceFontWeightCategory:false}}
  });
  mutableStyledString0: MutableStyledString = new MutableStyledString('hello', [{
    start: 0,
    length: 5,
    styledKey: StyledStringKey.FONT,
    styledValue: this.fontStyleAttr0
  }]);
  mutableStyledString1: MutableStyledString = new MutableStyledString('hello', [{
    start: 0,
    length: 5,
    styledKey: StyledStringKey.FONT,
    styledValue: this.fontStyleAttr1
  }]);
  mutableStyledString2: MutableStyledString = new MutableStyledString('hello', [{
    start: 0,
    length: 5,
    styledKey: StyledStringKey.FONT,
    styledValue: this.fontStyleAttr2
  }]);
  mutableStyledString3: MutableStyledString = new MutableStyledString('hello', [{
    start: 0,
    length: 5,
    styledKey: StyledStringKey.FONT,
    styledValue: this.fontStyleAttr3
  }]);
  mutableStyledString4: MutableStyledString = new MutableStyledString('hello', [{
    start: 0,
    length: 5,
    styledKey: StyledStringKey.FONT,
    styledValue: this.fontStyleAttr4
  }]);
  mutableStyledString5: MutableStyledString = new MutableStyledString('hello', [{
    start: 0,
    length: 5,
    styledKey: StyledStringKey.FONT,
    styledValue: this.fontStyleAttr5
  }]);
  controller:TextController = new TextController()
  getStyled(styledString:MutableStyledString){
    let styles = styledString.getStyles(0, styledString.length);
    if (styles.length !=0) {
      for (let i = 0; i < styles.length; i++) {
        console.info('StyledString style object start:' + styles[i].start);
        console.info('StyledString style object length:' + styles[i].length);
        console.info('StyledString style object key:' + styles[i].styledKey);
        if (styles[i].styledKey === 0) {
          let fontAttr = styles[i].styledValue as TextStyle;
          console.info('StyledString fontColor:' + fontAttr.fontColor);
          console.info('StyledString fontConfigs:' + fontAttr.fontConfigs?.fontWeightConfigs?.enableVariableFontWeight?.valueOf());
          console.info('StyledString fontConfigs:' + fontAttr.fontConfigs?.fontWeightConfigs?.enableDeviceFontWeightCategory?.valueOf());
          AppStorage.setOrCreate('enableVariableFontWeight',fontAttr.fontConfigs?.fontWeightConfigs?.enableVariableFontWeight?.valueOf()+'')
          AppStorage.setOrCreate('enableDeviceFontWeightCategory',fontAttr.fontConfigs?.fontWeightConfigs?.enableDeviceFontWeightCategory?.valueOf()+'')
        }
      }
    }
  }
  build() {
    Scroll(){
      Column() {
        Text('',{controller:this.controller})
          .id('styledStringFontConfigsTest')
        Button('getStyled0').onClick((event: ClickEvent) => {
          this.controller.setStyledString(this.mutableStyledString0)
          this.getStyled(this.mutableStyledString0)
        }).id('setAndGetMutableStyledString0')
        Button('getStyled1').onClick((event: ClickEvent) => {
          this.controller.setStyledString(this.mutableStyledString1)
          this.getStyled(this.mutableStyledString1)
        }).id('setAndGetMutableStyledString1')
        Button('getStyled2').onClick((event: ClickEvent) => {
          this.controller.setStyledString(this.mutableStyledString2)
          this.getStyled(this.mutableStyledString2)
        }).id('setAndGetMutableStyledString2')
        Button('getStyled3').onClick((event: ClickEvent) => {
          this.controller.setStyledString(this.mutableStyledString3)
          this.getStyled(this.mutableStyledString3)
        }).id('setAndGetMutableStyledString3')
        Button('getStyled4').onClick((event: ClickEvent) => {
          this.controller.setStyledString(this.mutableStyledString4)
          this.getStyled(this.mutableStyledString4)
        }).id('setAndGetMutableStyledString4')
        Button('getStyled5').onClick((event: ClickEvent) => {
          this.controller.setStyledString(this.mutableStyledString5)
          this.getStyled(this.mutableStyledString5)
        }).id('setAndGetMutableStyledString5')

      }.height('100%').width('100%').justifyContent(FlexAlign.Center)
    }
  }
}