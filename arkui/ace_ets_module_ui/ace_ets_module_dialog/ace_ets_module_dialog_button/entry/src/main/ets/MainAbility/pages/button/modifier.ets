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

class MyButtonModifier implements AttributeModifier<ButtonAttribute> {
  public isNum: number = 0
  public testCaseList: Array<LabelStyle | undefined> = [
    {
      maxLines: 3,
      textAlign: TextAlign.Start
    } as LabelStyle,
    {
      maxLines: 3,
      textAlign: TextAlign.Center
    } as LabelStyle,
    {
      maxLines: 3,
      textAlign: TextAlign.End
    } as LabelStyle,
    {
      maxLines: 3,
      textAlign: TextAlign.JUSTIFY
    } as LabelStyle,
    {
      maxLines: 3,
      textAlign: TextAlign.LEFT
    } as LabelStyle,
    {
      maxLines: 3,
      textAlign: TextAlign.RIGHT
    } as LabelStyle,
  ]

  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.labelStyle(this.testCaseList[this.isNum]);
  }
}

class MyButtonModifier1 implements AttributeModifier<ButtonAttribute> {
  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.labelStyle({
      textAlign: TextAlign.Start
    });
  }
}

class MyButtonModifier2 implements AttributeModifier<ButtonAttribute> {
  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.labelStyle({
      textAlign: TextAlign.Center
    });
  }
}

class MyButtonModifier3 implements AttributeModifier<ButtonAttribute> {
  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.labelStyle({
      textAlign: TextAlign.End
    });
  }
}

class MyButtonModifier4 implements AttributeModifier<ButtonAttribute> {
  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.labelStyle({
      textAlign: TextAlign.JUSTIFY
    });
  }
}

class MyButtonModifier5 implements AttributeModifier<ButtonAttribute> {
  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.labelStyle({
      textAlign: TextAlign.LEFT
    });
  }
}

class MyButtonModifier6 implements AttributeModifier<ButtonAttribute> {
  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.labelStyle({
      textAlign: TextAlign.RIGHT
    });
  }
}

class MyButtonModifier11 implements AttributeModifier<ButtonAttribute> {
  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.labelStyle({
      maxLines: 3,
      textAlign: TextAlign.Start
    });
  }
}

class MyButtonModifier22 implements AttributeModifier<ButtonAttribute> {
  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.labelStyle({
      maxLines: 3,
      textAlign: TextAlign.Center
    });
  }
}

class MyButtonModifier33 implements AttributeModifier<ButtonAttribute> {
  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.labelStyle({
      maxLines: 3,
      textAlign: TextAlign.End
    });
  }
}

class MyButtonModifier44 implements AttributeModifier<ButtonAttribute> {
  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.labelStyle({
      maxLines: 3,
      textAlign: TextAlign.JUSTIFY
    });
  }
}

class MyButtonModifier55 implements AttributeModifier<ButtonAttribute> {
  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.labelStyle({
      maxLines: 3,
      textAlign: TextAlign.LEFT
    });
  }
}

class MyButtonModifier66 implements AttributeModifier<ButtonAttribute> {
  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.labelStyle({
      maxLines: 3,
      textAlign: TextAlign.RIGHT
    });
  }
}

class MyButtonModifier4e5 implements AttributeModifier<ButtonAttribute> {
  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.labelStyle({
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
  @State modifier5: MyButtonModifier4 = new MyButtonModifier5()
  @State modifier6: MyButtonModifier4 = new MyButtonModifier6()
  @State modifier11: MyButtonModifier11 = new MyButtonModifier11()
  @State modifier22: MyButtonModifier22 = new MyButtonModifier22()
  @State modifier33: MyButtonModifier33 = new MyButtonModifier33()
  @State modifier44: MyButtonModifier44 = new MyButtonModifier44()
  @State modifier55: MyButtonModifier55 = new MyButtonModifier55()
  @State modifier66: MyButtonModifier66 = new MyButtonModifier66()
  @State modifier4e5: MyButtonModifier4e5 = new MyButtonModifier4e5()
  @State textvalue: string[] = ['我是谁', 'who am I', '!@#$%', '123456', '哈ji*0.',
    'helloThellohello hello hellohello hello hellohello hello helloh ellohell ohellohellohel lohellohellohellohellohellohello']
  @State textAlignIndex: number = 0
  @State textValueIndex: number = 0

  build() {
    Scroll() {
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

        Row() {
          Button('start')
            .onClick(() => {
              this.modifier.isNum = 0;
            })
          Button('center')
            .onClick(() => {
              this.modifier.isNum = 1;
            })
          Button('end')
            .onClick(() => {
              this.modifier.isNum = 2;
            })
          Button('justify')
            .onClick(() => {
              this.modifier.isNum = 3;
            })
          Button('left')
            .onClick(() => {
              this.modifier.isNum = 4;
            })
          Button('right')
            .onClick(() => {
              this.modifier.isNum = 5;
            })
        }

        Button(this.textvalue[this.textValueIndex])
          .attributeModifier(this.modifier)
          .key('textValue')

        Text('设置长文本高度自适应方式为以maxLines优先')
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
          .attributeModifier(this.modifier55)
          .key('modifier55')
        Button('helloThellohello hello hellohello hello hellohello hello helloh ellohell ohellohellohel lohellohellohellohellohellohello')
          .attributeModifier(this.modifier66)
          .key('modifier66')

        Text('设置长文本段落在水平方向的对齐方式')
        Button('helloThellohello hello hellohello hello hellohello hello helloh ellohell ohellohellohel lohellohellohellohellohellohello')
          .width('20%')
          .attributeModifier(this.modifier1)
          .key('modifier1')
        Button('helloThellohello hello hellohello hello hellohello hello helloh ellohell ohellohellohel lohellohellohellohellohellohello')
          .width('20%')
          .attributeModifier(this.modifier2)
          .key('modifier2')
        Button('helloThellohello hello hellohello hello hellohello hello helloh ellohell ohellohellohel lohellohellohellohellohellohello')
          .width('20%')
          .attributeModifier(this.modifier3)
          .key('modifier3')
        Button('helloThellohello hello hellohello hello hellohello hello helloh ellohell ohellohellohel lohellohellohellohellohellohello')
          .width('20%')
          .attributeModifier(this.modifier4)
          .key('modifier4')
        Button('helloThellohello hello hellohello hello hellohello hello helloh ellohell ohellohellohel lohellohellohellohellohellohello')
          .width('20%')
          .attributeModifier(this.modifier5)
          .key('modifier5')
        Button('helloThellohello hello hellohello hello hellohello hello helloh ellohell ohellohellohel lohellohellohellohellohellohello')
          .width('20%')
          .attributeModifier(this.modifier6)
          .key('modifier6')
        Text('undefined')
        Button('helloThellohello hello hellohello hello hellohello hello helloh ellohell ohellohellohel lohellohellohellohellohellohello')
          .width('20%')
          .attributeModifier(this.modifier4e5)

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

        Button() {
          Text('hello 5463456 hello hellohello')
            .textAlign(TextAlign.Start)
        }.attributeModifier(this.modifier55)
        .width('20%')
        .key('modifierDiff5')

        Button() {
          Text('hello 5463456 hello hellohello')
            .textAlign(TextAlign.End)
        }.attributeModifier(this.modifier66)
        .width('20%')
        .key('modifierDiff6')
      }
    }
  }
}