'use static'

import { Entry,Text,Column,Row,Component,Button,ClickEvent,Scroll,RichEditor,RichEditorController,CutEvent,FlexAlign,
  RichEditorOptions,Color,EnterKeyType,AttributeModifier,RichEditorAttribute,TextRange,RichEditorTextSpanResult} from '@ohos.arkui.component'
import { State,Observed } from '@ohos.arkui.stateManagement'

@Observed
class MyOnReadyModifier implements AttributeModifier<RichEditorAttribute> {
  public count: int = 0
  public isOnReady: boolean = true;
  applyNormalAttribute(instance: RichEditorAttribute): void {
    instance.onReady(this.isOnReady ? undefined : () => {
        this.count++;
      })
  }
}

@Entry
@Component
struct SoftKeyboardEnterTypeExample {
  @State myModifier:MyOnReadyModifier = new MyOnReadyModifier()
  controller: RichEditorController = new RichEditorController();

  build() {
    Column() {
      Text('count:' + this.myModifier.count)
        .id('richEditor_text')

      RichEditor({ controller: this.controller } as RichEditorOptions)
        .margin(10)
        .id('RichEditor_1')
        .border({ width: 1 })
        .height(200)
        .borderWidth(1)
        .borderColor(Color.Red)
        .width('100%')
        .enterKeyType(EnterKeyType.Search)
        .attributeModifier(this.myModifier)

    }.height('100%').justifyContent(FlexAlign.Center)
  }
}