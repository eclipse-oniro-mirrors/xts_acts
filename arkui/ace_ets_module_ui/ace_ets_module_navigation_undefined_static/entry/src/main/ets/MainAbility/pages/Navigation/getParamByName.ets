'use static'
import {
  NavPathStack, ButtonType, FontWeight, Component, Text, NavDestination, Column, Entry, Scroll, Button
} from '@ohos.arkui.component'
import {Consume, Provide, State, Observed} from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import { MultiNavigation, MultiNavPathStack, SplitPolicy } from '@ohos.arkui.advanced.MultiNavigation';

class TmpClass {
  public count: number = 10;
}

@Entry
@Component
struct Test1 {
  @State message: string = 'Hello World:';
  @Provide pageStack: MultiNavPathStack = new MultiNavPathStack();
  @State index: int = 0;
  @State resultText: string = 'No result yet';

  build() {
    NavDestination() {
      Column() {
        Column() {
          Text(this.message + this.index)
            .fontSize(40)
            .fontWeight(FontWeight.Bold)
          Text('Result: ' + this.resultText)
            .id('resultText')
            .fontSize(20)
            .margin(10)
        }
        .width('100%')
        .height('15%')
        Scroll(){
          Column() {
            Button('pushPathByName', { stateEffect: true, type: ButtonType.Capsule})
              .id('pushButton')
              .width('50%')
              .height(40)
              .margin(20)
              .onClick(() => {
                if (this.pageStack !== undefined && this.pageStack !== null) {
                  // 跳转至PageFull1页面
                  let tmp = new TmpClass();
                  console.info(0x0000, 'demoTest', '[tjm] pushPathByName: PageFull1');
                  this.pageStack.pushPathByName('PageHome1', 'testParam', true, SplitPolicy.HOME_PAGE);
                  this.index++;
                }
              })
            Button('getParamByName', { stateEffect: true, type: ButtonType.Capsule})
              .id('getParamButton')
              .width('50%')
              .height(40)
              .margin(20)
              .onClick(() => {
                if (this.pageStack !== undefined && this.pageStack !== null) {
                  // 获取名称为PageHome1的页面的参数
                  let result = this.pageStack.getParamByName('PageHome1');
                  console.info(0x0000, 'demoTest', '[tjm] getParamByName: ' + result);

                  if (result && Array.isArray(result)) {
                    this.resultText = result.length.toString();
                    result.forEach((item, index) => {
                      console.info(0x0000, 'demoTest', `[tjm] 第${index + 1}个元素: ${item}`);
                    });
                    console.info(0x0000, 'demoTest', `[tjm] 是一个数组`);
                  } else if (result) {
                    // 如果result不是数组但是有值
                    this.resultText = 'Value: ' + result;
                    console.info(0x0000, 'demoTest', `[tjm] 结果: ${result}`);
                  } else {
                    this.resultText = 'No result found';
                    console.info(0x0000, 'demoTest', '[tjm] 没有获取到结果');
                  }
                }
              })
          }
        }.width('100%')
      }.width('100%').height('92%')
    }.hideTitleBar(true)
  }
}