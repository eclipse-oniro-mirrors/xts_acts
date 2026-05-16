import plugin from "./plugin_component"

interface Info {
  errcode: number,
  msg: string
}

@Entry
@Component
struct PluginUserExample4 {
  @State message: string = 'PluginComponent异常值测试';
  @State keyName: string = '';
  private keyNames = ['', 'owner_bundleName', 'owner_abilityName', 'target_bundleName', 'target_abilityName', 'name', 'data', 'jsonPath', 'callback'];
  @State value: string = '';
  private values = ['12345678901234567890123456789', '中文中文中文中文中文中文中文中文', '&%$#@!&**??(*)_+?><:"{}[]//////\\\\dddd'];
  @State num: number = 4;
  private num2 = 0;
  private num3 = 0;

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text(this.message)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
      Text('Register Push Listener: 参数数=' + (this.num%5) + ', request内容: key=' + this.keyName + ', value=' + this.value)
        .fontSize(15)
        .fontWeight(FontWeight.Bold)
      Button('改变Push Listener callback').onClick(()=>{
        this.num += 1
        console.log("yjl Register Push Listener: num=" + this.num%5)
      })
      Button('改变Request key').onClick(()=>{
        this.num2 += 1
        this.keyName = this.keyNames[this.num2%this.keyNames.length]
        console.log("yjl Request: key = " + this.keyName)
      })
      Button('改变Request value').onClick(()=>{
        this.num3 += 1
        this.value = this.values[this.num3%this.values.length]
        console.log("yjl Request: value = " + this.value)
      })

      Button('Register Push Listener')
        .fontSize(25)
        .width(400)
        .height(30)
        .margin({ top: 20 })
        .onClick(() => {
          plugin.onListener(this.num%5)
          console.log("yjl Button('Register Push Listener')")
        })
      Button('Request')
        .fontSize(25)
        .width(400)
        .height(30)
        .margin({ top: 20 })
        .onClick(() => {
          plugin.Request(this.keyName, this.value, 'Index3')
          console.log("yjl Button('Request')")
        })
      PluginComponent({
        // 提供方
        template: { source: 'pages/Index3.ets&entry', bundleName: 'com.example.provider' },
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