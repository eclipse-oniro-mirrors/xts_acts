'use static'


import {
  Entry,
  Component,
  TextMenuItem,
  ResourceStr,
  RichEditorController,
  RichEditorOptions,
  RichEditor,
  TextRange,
  Column,
  ColumnOptions,
  Row,
  TextMenuItemId,
  $r,
  Button,
  TextArea,
  TextInput,
  Search,
  Color,
  Text,
  CopyOptions,
  ClickEvent,
  EditMenuOptions,
  AttributeModifier,
  TextAreaAttribute,
  TextInputAttribute
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
class TextInputModifier implements AttributeModifier<TextInputAttribute> {
  public state: boolean = false;
  public content: ResourceStr = '';
  onCreateMenu(menuItems: Array<TextMenuItem>) {
    let item1: TextMenuItem = {
      content: '123456',
      icon: $r('app.media.icon'),
      id: TextMenuItemId.of('custom1'),
      labelInfo: 'abc123456'
    }
    let item3: TextMenuItem = {
      content: '111111',
      icon: $r('app.media.icon'),
      id: TextMenuItemId.of('custom1'),
      labelInfo: undefined
    }
    let item2: TextMenuItem = {
      content: 'custom2',
      id: TextMenuItemId.of('custom2'),
      icon: $r('app.media.icon'),
      labelInfo: $r('app.media.icon')
    }

    let extensionMenuItems: TextMenuItem[] = [];

    extensionMenuItems.push(item1)
    extensionMenuItems.push(item3)
    extensionMenuItems.unshift(item2)
    return extensionMenuItems
  }
  applyNormalAttribute(instance: TextInputAttribute): void {
    if (this.state == false) {
      instance.editMenuOptions(undefined);
    } else {
      instance.editMenuOptions(this.state ? {
        onCreateMenu: this.onCreateMenu, onMenuItemClick: (menuItem: TextMenuItem, textRange: TextRange) => {
          if (menuItem.id.equals(TextMenuItemId.of('custom1'))) {
            console.log('拦截 id: custom1 start:' + textRange.start + '; end:' + textRange.end )
            this.content = menuItem.content
            return true;
          }
          if (menuItem.id.equals(TextMenuItemId.of('custom2'))) {
            console.log('拦截 id: custom2 start:' + textRange.start + '; end:' + textRange.end )
            this.content = menuItem.content
            return true;
          }
          if (menuItem.id.equals(TextMenuItemId.COPY)) {
            console.log('拦截 COPY start:' + textRange.start + '; end:' + textRange.end+'   labelInfo:'+menuItem.labelInfo + '   content:'+menuItem.content)
            this.content = menuItem.content
            return true;
          }
          if (menuItem.id.equals(TextMenuItemId.SELECT_ALL)) {
            console.log('不拦截 SELECT_ALL start:' + textRange.start + '; end:' + textRange.end+'   labelInfo:'+menuItem.labelInfo + '   content:'+menuItem.content)
            this.content = menuItem.content
            return false;
          }
          return true;
        }
      } as EditMenuOptions : undefined);
    }
  }
}

@Entry
@Component
struct TextInputExample {
  @State text: string = 'As the sun begins to set, casting a warm golden hue across the sky,' +
    'the world seems to slow down and breathe a sigh of relief. The sky is painted with hues of orange, ' +
    ' pink, and lavender, creating a breathtaking tapestry that stretches as far as the eye can see.' +
    'The air is filled with the sweet scent of blooming flowers, mingling with the earthy aroma of freshly turned soil.' +
    'it casts a warm,' +
    'golden hue that spreads like liquid amber across the vast expanse of the sky.' +
    'The once-blue heavens gradually transform, '
  @State textInputModifier: TextInputModifier = new TextInputModifier();
  build() {
    Row() {
      Column( { space: 10 } as ColumnOptions ) {
        Text(`${this.textInputModifier.content}`).id('Text')
        Button(`editMenuOptions: ${this.textInputModifier.state}`)
          .id('button_editMenuOptions')
          .width(240)
          .fontSize(16)
          .margin(10)
          .onClick((e: ClickEvent)=>{
            this.textInputModifier.content = '';
            this.textInputModifier.state = ! this.textInputModifier.state;
          })
        Search({value: ''})
          .id('Search')
        TextInput({text: this.text})
          .attributeModifier(this.textInputModifier)
          .height(156)
          .margin(50)
          .id('TextInput')

      }.width('100%')
    }
    .height('100%')
  }
}