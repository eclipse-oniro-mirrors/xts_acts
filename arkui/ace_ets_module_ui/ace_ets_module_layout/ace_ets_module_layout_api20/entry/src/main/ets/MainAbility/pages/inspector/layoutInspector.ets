
import { FrameNode, inspector, UIContext } from '@kit.ArkUI';
import fs from '@ohos.file.fs';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@kit.BasicServicesKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
@Component
struct ChildComponent {
    build() {
        Column(){
            Button(`Hello World`).onClick(() => {
                console.log('layoutinspector Hello World')
            })
            Image($r('app.media.icon')).height(20).focusable(true)
        }
    }
}
@Entry
@Component
struct ComponentPage {
  private context = getContext(this) as common.UIAbilityContext;
    loopConsole(testStr: string, i: string){
        console.log(`layoutinspector ${i}| type: ${JSON.parse(testStr).$type}, ID: ${JSON.parse(testStr).$ID}`)

        if (JSON.parse(testStr).$children) {
            i += '-'
            for (let index = 0; index < JSON.parse(testStr).$children.length; index++) {
                this.loopConsole(JSON.stringify(JSON.parse(testStr).$children[index]), i)
            }
        }
    }
    onPageShow(): void {
        globalThis.context = this.getUIContext()
    }
    @State str: string = ''
    build() {
        Scroll(){
            Column({ space: 5 }) {
                Text('Hello World').fontSize(20).fontColor(Color.Black)
                ChildComponent()
            }
      .id('Test_Column')
                .width('100%')
        }

    .height('100%')
    }
}

