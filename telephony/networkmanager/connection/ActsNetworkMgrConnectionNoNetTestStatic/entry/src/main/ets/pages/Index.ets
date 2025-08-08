import { memo} from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import { Entry, Text, TextAttribute, Column, Component, Button, ClickEvent } from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { State} from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import hilog from '@ohos.hilog'
import connection from '@ohos.net.connection';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'ConnectionTestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
@Entry
@Component
struct MyStateSample {
  @State stateVar: string = 'state var';
  message: string = 'var';
  changeValue() {

  }
  build() {
    Column(undefined) {
      Text('Hello World').fontSize(20)
      Button("getImsRegInfo")
        .margin(8)
        .width('40%')
        .height('5%')
        .backgroundColor('#0ddffb')
        .onClick((e: ClickEvent) => {
          hilog.info(domain, tag, '%{public}s', 'caseName'+ '---test end');
          let netHandle: connection.NetHandle = connection.getDefaultNetSync();
          hilog.info(domain, tag, '%{public}s', 'caseName'+ '---test end'+JSON.stringify(netHandle));
        })
      Text(this.stateVar).fontSize(20)
      Child({stateVar: this.stateVar} as __Options_Child)
    }
  }
}

@Component
struct Child {
  @State stateVar: string = 'Child';
  build() {
    Text(this.stateVar).fontSize(50)
  }
}
