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
class TextModifier51 implements AttributeModifier<TextAttribute> {

  applyNormalAttribute(instance: TextAttribute): void {
    instance.dataDetectorConfig({
      types : [TextDataDetectorType.PHONE_NUMBER],
      enablePreviewMenu: true
    })
  }
}

class TextModifier52 implements AttributeModifier<TextAttribute> {

  applyNormalAttribute(instance: TextAttribute): void {
    instance.dataDetectorConfig({
      types : [TextDataDetectorType.PHONE_NUMBER],
      enablePreviewMenu: false
    })
  }
}

class TextModifier53 implements AttributeModifier<TextAttribute> {

  applyNormalAttribute(instance: TextAttribute): void {
    instance.dataDetectorConfig({
      types : [TextDataDetectorType.PHONE_NUMBER],
      enablePreviewMenu: undefined
    })
  }
}

@Entry
@Component
struct TextEnablePreviewMenu {
  @State TextModifier1: TextModifier51 = new TextModifier51()
  @State TextModifier2: TextModifier52 = new TextModifier52()
  @State TextModifier3: TextModifier53 = new TextModifier53()
  @State phoneNumber: string = '(86) (755) ********';
  @State url: string = 'www.********.com';
  @State email: string = '2495218076@qq.com';
  @State address: string = 'XX省XX市XX区XXXX';
  @State datetime: string = 'XX年XX月XX日XXXX';
  @State enablePreviewMenu: boolean | undefined = false;

  build() {
    Column({ space: 2 }){
      Text('TextDataDetectorConfig: enablePreviewMenu').height('5%')

      Button('enablePreviewMenu: true').height('5%')
        .id('enablePreviewMenu_true')
        .onClick(()=>{
          this.enablePreviewMenu = true
        })

      Button('enablePreviewMenu: undefined').height('5%')
        .id('enablePreviewMenu_undefined')
        .onClick(()=>{
          this.enablePreviewMenu = undefined
        })
      Text('邮箱：' + this.email)
        .fontSize(16)
        .copyOption(CopyOptions.InApp)
        .enableDataDetector(true)
        .dataDetectorConfig({ types : [TextDataDetectorType.EMAIL] })
        .textAlign(TextAlign.Center)
        .borderWidth(1)
        .height('15%')
        .id('enablePreviewMenu_default')

      Text(
        '电话号码：' + this.phoneNumber + '\n' +
        '链接：' + this.url + '\n' +
        '邮箱：' + this.email + '\n' +
        '地址：' + this.address + '\n' +
        '时间：' + this.datetime
      )
        .fontSize(16)
        .copyOption(CopyOptions.InApp)
        .enableDataDetector(true)
        .dataDetectorConfig({
          types : [TextDataDetectorType.PHONE_NUMBER],
          enablePreviewMenu: this.enablePreviewMenu
        })
        .textAlign(TextAlign.Center)
        .borderWidth(1)
        .height('15%')
        .id('enablePreviewMenu_set')

      Text(
        '电话号码：' + this.phoneNumber + '\n' +
          '链接：' + this.url + '\n' +
          '邮箱：' + this.email + '\n' +
          '地址：' + this.address + '\n' +
          '时间：' + this.datetime
      )
        .fontSize(16)
        .copyOption(CopyOptions.InApp)
        .enableDataDetector(true)
        .attributeModifier(this.TextModifier1)
        .textAlign(TextAlign.Center)
        .borderWidth(1)
        .height('15%')
        .id('Modifier_enablePreviewMenu_true')

      Text(
        '电话号码：' + this.phoneNumber + '\n' +
          '链接：' + this.url + '\n' +
          '邮箱：' + this.email + '\n' +
          '地址：' + this.address + '\n' +
          '时间：' + this.datetime
      )
        .fontSize(16)
        .copyOption(CopyOptions.InApp)
        .enableDataDetector(true)
        .attributeModifier(this.TextModifier2)
        .textAlign(TextAlign.Center)
        .borderWidth(1)
        .height('15%')
        .id('Modifier_enablePreviewMenu_false')

      Text(
        '电话号码：' + this.phoneNumber + '\n' +
          '链接：' + this.url + '\n' +
          '邮箱：' + this.email + '\n' +
          '地址：' + this.address + '\n' +
          '时间：' + this.datetime
      )
        .fontSize(16)
        .copyOption(CopyOptions.InApp)
        .enableDataDetector(true)
        .attributeModifier(this.TextModifier3)
        .textAlign(TextAlign.Center)
        .borderWidth(1)
        .height('15%')
        .id('Modifier_enablePreviewMenu_undefined')
    }
  }
}

