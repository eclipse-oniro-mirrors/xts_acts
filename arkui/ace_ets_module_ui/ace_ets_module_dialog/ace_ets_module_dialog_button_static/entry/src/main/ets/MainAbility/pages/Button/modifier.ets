/*
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

'use static'
import {
  Blank,
  Font,
  TextAlign,
  ClickEvent,
  Divider,
  Component,
  Column,
  Button,
  AttributeModifier,
  ButtonAttribute,
  ButtonLabelStyle,
  Entry,
  Row,
  Text
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
class MyButtonModifier implements AttributeModifier<ButtonAttribute> {
  public isNum: int = 0
  public testCaseList: Array<ButtonLabelStyle | undefined> = [
    {
      maxLines: 3,
      textAlign: TextAlign.Start
    } as ButtonLabelStyle,
    {
      maxLines: 3,
      textAlign: TextAlign.Center
    } as ButtonLabelStyle,
    {
      maxLines: 3,
      textAlign: TextAlign.End
    } as ButtonLabelStyle,
    {
      maxLines: 3,
      textAlign: TextAlign.JUSTIFY
    } as ButtonLabelStyle,
    {
      maxLines: 3,
      textAlign: undefined
    } as ButtonLabelStyle,
  ]

  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.labelStyle(this.testCaseList[this.isNum]);
  }
}

@Observed
class MyButtonModifier1 implements AttributeModifier<ButtonAttribute> {
  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.labelStyle({
      textAlign: TextAlign.Start
    });
  }
}

@Observed
class MyButtonModifier2 implements AttributeModifier<ButtonAttribute> {
  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.labelStyle({
      textAlign: TextAlign.Center
    });
  }
}

@Observed
class MyButtonModifier3 implements AttributeModifier<ButtonAttribute> {
  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.labelStyle({
      textAlign: TextAlign.End
    });
  }
}

@Observed
class MyButtonModifier4 implements AttributeModifier<ButtonAttribute> {
  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.labelStyle({
      textAlign: TextAlign.JUSTIFY
    });
  }
}

@Observed
class MyButtonModifier11 implements AttributeModifier<ButtonAttribute> {
  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.labelStyle({
      maxLines: 3,
      textAlign: TextAlign.Start
    });
  }
}

@Observed
class MyButtonModifier22 implements AttributeModifier<ButtonAttribute> {
  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.labelStyle({
      maxLines: 3,
      textAlign: TextAlign.Center
    });
  }
}

@Observed
class MyButtonModifier33 implements AttributeModifier<ButtonAttribute> {
  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.labelStyle({
      maxLines: 3,
      textAlign: TextAlign.End
    });
  }
}

@Observed
class MyButtonModifier44 implements AttributeModifier<ButtonAttribute> {
  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.labelStyle({
      maxLines: 3,
      textAlign: TextAlign.JUSTIFY
    });
  }
}

@Observed
class MyButtonModifier4e4 implements AttributeModifier<ButtonAttribute> {
  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.labelStyle({
      maxLines: 3,
      textAlign: undefined
    });
  }
}

@Entry
@Component
struct Modifier {
  @State modifier: MyButtonModifier = new MyButtonModifier()
  @State modifier1: MyButtonModifier1 = new MyButtonModifier1()
  @State modifier2: MyButtonModifier2 = new MyButtonModifier2()
  @State modifier3: MyButtonModifier3 = new MyButtonModifier3()
  @State modifier4: MyButtonModifier4 = new MyButtonModifier4()
  @State modifier11: MyButtonModifier11 = new MyButtonModifier11()
  @State modifier22: MyButtonModifier22 = new MyButtonModifier22()
  @State modifier33: MyButtonModifier33 = new MyButtonModifier33()
  @State modifier44: MyButtonModifier44 = new MyButtonModifier44()
  @State modifier4e4: MyButtonModifier4e4 = new MyButtonModifier4e4()
  @State textvalue: string[] = ['我是谁', 'who am I', '!@#$%', '123456', '哈ji*0.',
    'helloThellohello hello hellohello hello hellohello hello helloh ellohell ohellohellohel lohellohellohellohellohellohello']
  private textAlignArray: Array<ButtonLabelStyle | undefined> = [
    {

      textAlign: TextAlign.Start
    } as ButtonLabelStyle,
    {

      textAlign: TextAlign.Center
    } as ButtonLabelStyle,
    {

      textAlign: TextAlign.End
    } as ButtonLabelStyle,
    {

      textAlign: TextAlign.JUSTIFY
    } as ButtonLabelStyle,
    {

      textAlign: undefined
    } as ButtonLabelStyle,
  ]
  @State textAlignIndex: int = 0
  @State textValueIndex: int = 0

  build() {
    Column() {
      Row() {
        Button('change_vale')
          .onClick(() => {
            this.textValueIndex++
            if (this.textValueIndex > this.textvalue.length - 1) {
              this.textValueIndex = 0
            }
          })
        Button('change_align').fontSize(20)
          .onClick((e: ClickEvent) => {
            this.modifier.isNum = (this.modifier.isNum + 1) % this.modifier.testCaseList.length
          })
      }

      Button(this.textvalue[this.textValueIndex])
        .width(200)
        .attributeModifier(this.modifier)

      Button('helloThellohello hello hellohello hello hellohello hello helloh ellohell ohellohellohel lohellohellohellohellohellohello')
        .attributeModifier(this.modifier11)
        .key('modifier11')
      Button('helloThellohello hello hellohello hello hellohello hello helloh ellohell ohellohellohel lohellohellohellohellohellohello')
        .attributeModifier(this.modifier22)
        .key('modifier22')
      Button('helloThellohello hello hellohello hello hellohello hello helloh ellohell ohellohellohel lohellohellohellohellohellohello')
        .attributeModifier(this.modifier33)
        .key('modifier33')
      Button('helloThellohello hello hellohello hello hellohello hello helloh ellohell ohellohellohel lohellohellohellohellohellohello')
        .attributeModifier(this.modifier44)
        .key('modifier44')

      Button('helloThellohello hello hellohello hello hellohello hello helloh ellohell ohellohellohel lohellohellohellohellohellohello')
        .width(100)
        .attributeModifier(this.modifier1)
        .key('modifier1')
      Button('helloThellohello hello hellohello hello hellohello hello helloh ellohell ohellohellohel lohellohellohellohellohellohello')
        .width(100)
        .attributeModifier(this.modifier2)
        .key('modifier2')
      Button('helloThellohello hello hellohello hello hellohello hello helloh ellohell ohellohellohel lohellohellohellohellohellohello')
        .width(100)
        .attributeModifier(this.modifier3)
        .key('modifier3')
      Button('helloThellohello hello hellohello hello hellohello hello helloh ellohell ohellohellohel lohellohellohellohellohellohello')
        .width(100)
        .attributeModifier(this.modifier4)
        .key('modifier4')

      Text('设置不同对齐end-center')
      Button() {
        Text('hello 5463456 hello hellohello')
          .textAlign(TextAlign.End)
      }.attributeModifier(this.modifier22)
      .width('20%')
      .key('modifierDiff1')

      Button() {
        Text('hello 5463456 hello hellohello')
          .textAlign(TextAlign.Center)
      }.attributeModifier(this.modifier11)
      .width('20%')
      .key('modifierDiff2')

      Button() {
        Text('hello 5463456 hello hellohello')
          .textAlign(TextAlign.Center)
      }.attributeModifier(this.modifier33)
      .width('20%')
      .key('modifierDiff3')

      Button() {
        Text('hello 5463456 hello hellohello')
          .textAlign(TextAlign.Center)
      }.attributeModifier(this.modifier44)
      .width('20%')
      .key('modifierDiff4')
    }
  }
}