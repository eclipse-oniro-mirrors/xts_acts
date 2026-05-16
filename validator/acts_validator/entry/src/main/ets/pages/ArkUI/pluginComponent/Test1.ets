import plugin from "./plugin_component"

interface Info {
  errcode: number,
  msg: string
}

@Entry
@Component
struct PluginUserExample {
  @State message: string = 'PluginComponent功能测试';

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text(this.message)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
      Button('Register Push Listener')
        .fontSize(30)
        .width(400)
        .height(100)
        .margin({ top: 20 })
        .onClick(() => {
          plugin.onListener()
          console.log("yjl Button('Register Push Listener')")
        })
      Button('Request')
        .fontSize(50)
        .width(400)
        .height(100)
        .margin({ top: 20 })
        .onClick(() => {
          plugin.Request()
          console.log("yjl Button('Request')")
        })
      PluginComponent({
        // 提供方
        template: { source: 'pages/Index.ets&entry', bundleName: 'com.example.provider' },
        data: { 'countDownStartValue': 'new countDownStartValue' }
      }).size({ width: 500, height: 350 })
        .onComplete(() => {
          console.log("yjl onComplete")
        })
        .onError((info: Info) => {
          console.log("yjl onError code=" + info.errcode + ", msg=" + info.msg)
        })
    }
    .width('100%')
    .height('100%')
  }
}
