interface Info {
  errcode: number,
  msg: string
}

@Entry
@Component
struct PluginUserExample3 {
  @State message: string = '测试PluginComponent拉起同应用页面';

  build() {
    Column() {
      Text(this.message)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)

      PluginComponent(
        {
          template: { source: "pages/ArkUI/pluginComponent/Plugin.ets", bundleName: "com.example.actsvalidator" },
          data: { imageName: "123456" }
        })
        .size({ width: "100%", height: "30%" })
        .onComplete(() => {
          console.log("yjl onComplete")
        })
        .onError((info: Info) => {
          console.log("yjl onError code=" + info.errcode + ", msg=" + info.msg)
        })
    }
    .height('100%')
    .width('100%')
  }
}
