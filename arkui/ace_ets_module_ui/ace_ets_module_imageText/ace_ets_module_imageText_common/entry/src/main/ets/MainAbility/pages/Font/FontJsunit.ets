
/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import font from '@ohos.font';

@Entry
@Component
struct FontExample {
  fontList: Array<string> = [];
  fontInfo: font.FontInfo = font.getFontByName('');
  @State value:string=''
  @State value1:string=''

  aboutToAppear(){
  }

  build() {
    Column() {
      Text(this.value).key('fontList').key('fontlist')
      Text(this.value1).key('fontName').key('fontName')
      
      Button('getSystemFontList')
        .width('60%')
        .height('6%')
        .onClick(()=>{
          this.fontList = font.getSystemFontList()
          this.value = this.fontList.toString()
          AppStorage.setOrCreate('fontList',this.fontList)
          console.log('fontListLength'+this.fontList.length)
        }).margin({top:20}).key('getSystemFontList')

      Button('getgetFontByName')
        .width('60%')
        .height('6%')
        .key('getgetFontByName')
        .onClick(()=>{
          this.fontInfo = font.getFontByName('HarmonyOS Sans Italic')
          if(this.fontInfo != null) {
             this.value1 = this.fontInfo.fullName
             console.log('getFontByName(): path = ' + this.fontInfo.path)
             console.log('getFontByName(): postScriptName = ' + this.fontInfo.postScriptName)
             console.log('getFontByName(): fullName = ' + this.fontInfo.fullName)
             console.log('getFontByName(): Family = ' + this.fontInfo.family)
             console.log('getFontByName(): Subfamily = ' + this.fontInfo.subfamily)
             console.log('getFontByName(): weight = ' + this.fontInfo.weight)
             console.log('getFontByName(): width = ' + this.fontInfo.width)
             console.log('getFontByName(): italic = ' + this.fontInfo.italic)
             console.log('getFontByName(): monoSpace = ' + this.fontInfo.monoSpace)
             console.log('getFontByName(): symbolic = ' + this.fontInfo.symbolic)
          } 
          
        }).margin({top:20})
    }.width('100%').height('100%')
  }
}