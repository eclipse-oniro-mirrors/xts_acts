import { pluginComponentManager } from '@kit.ArkUI'
import { PluginComponentTemplate } from '@kit.ArkUI'

interface Info {
  errcode: number,
  msg: string
}

function onPushListener(source: Want, template: PluginComponentTemplate,
  data: pluginComponentManager.KVObject, extraData: pluginComponentManager.KVObject) {
  console.log("yjl onPushListener source=" + JSON.stringify(source))
  console.log("yjl onPushListener template.source=" + template.source)
  console.log("yjl onPushListener template.ability=" + template.ability)
  console.log("yjl onPushListener data=" + JSON.stringify(data))
  console.log("yjl onPushListener extraData=" + JSON.stringify(extraData))
}

function onPushListenerNoSource(template: PluginComponentTemplate,
  data: pluginComponentManager.KVObject, extraData: pluginComponentManager.KVObject) {
  console.log("yjl onPushListener3333333333333333333 no extraData")
  console.log("yjl onPushListener template.source=" + template.source)
  console.log("yjl onPushListener template.ability=" + template.ability)
  console.log("yjl onPushListener data=" + JSON.stringify(data))
}

function onPushListenerNoTemplate(source: Want,
  data: pluginComponentManager.KVObject, extraData: pluginComponentManager.KVObject) {
  console.log("yjl onPushListener222222222222222222 no extraData and data")
  console.log("yjl onPushListener source=" + JSON.stringify(source))
}

function onPushListenerNoData(source: Want, template: PluginComponentTemplate,
  data: pluginComponentManager.KVObject) {
  console.log("yjl onPushListener11111111111111111111 no extraData and data and template")
  console.log("yjl onPushListener source=" + source)
}

@Entry
@Component
struct PluginUserExample5 {
  @State message: string = 'PluginComponent异常值测试-ETS';
  @State keyName: string = '';
  private keyNames = ['', 'owner_bundleName', 'owner_abilityName', 'target_bundleName', 'target_abilityName', 'name', 'data', 'jsonPath'];
  @State value: string = '';
  private values = ['a111b2222c3333d444f555g666h7777', '测试测试测试测试', '////123%%%$$$###@@@!^&**(()~~>><<::{{}}}|||'];
  private num2 = 0;
  private num3 = 0;
  private onParam: string = ''

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text(this.message)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
      Text('Request内容: key=' + this.keyName + ', value=' + this.value)
        .fontSize(15)
        .fontWeight(FontWeight.Bold)

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
          // if (this.onParam == 'source') {
          //   pluginComponentManager.on("push", onPushListenerNoSource)
          // } else if (this.onParam == 'template') {
          //   pluginComponentManager.on("push", onPushListenerNoTemplate)
          // } else if (this.onParam == 'data') {
          //   pluginComponentManager.on("push", onPushListenerNoData)
          // } else {
          //   pluginComponentManager.on("push", onPushListener)
          // }

          pluginComponentManager.on("push", onPushListener)
          console.log("yjl Button('Register Push Listener')")
        })
      Button('Request')
        .fontSize(25)
        .width(400)
        .height(30)
        .margin({ top: 20 })
        .onClick(() => {
          console.log("yjl request key=" + this.keyName + ", value=" + this.value)
          // 原始赋值
          let owner_bundleName = 'com.example.actsvalidator'
          let owner_abilityName = 'com.example.actsvalidator.EntryAbility'
          let target_bundleName = 'com.example.provider'
          let target_abilityName = 'com.example.provider.EntryAbility'
          let name = 'Index4'
          let data = {
            "key_1": "plugin component request data",
            "key_2": 67890
          } as pluginComponentManager.KVObject
          let jsonPath = ''

          // 改值
          if (this.keyName == 'owner_bundleName') {
            owner_bundleName = this.value
          } else if (this.keyName == 'owner_abilityName') {
            owner_abilityName = this.value
          } else if (this.keyName == 'target_bundleName') {
            target_bundleName = this.value
          } else if (this.keyName == 'target_abilityName') {
            target_abilityName = this.value
          } else if (this.keyName == 'name') {
            name = this.value
          } else if (this.keyName == 'data') {
            data = {
              "key_1" : this.value
            }
          } else if (this.keyName == 'jsonPath') {
            jsonPath = this.value
          }

          // 组件使用方主动发送事件，owner:使用方，target:提供方
          pluginComponentManager.request({
            owner: {
              bundleName: owner_bundleName,
              abilityName: owner_abilityName,
            },
            target: {
              bundleName: target_bundleName,
              abilityName: target_abilityName,
            },
            name: name,
            data: data,
            jsonPath: jsonPath,
          },
            (err, data) => {
              console.log("yjl request_callback: componentTemplate.ability=" + data.componentTemplate.ability)
              console.log("yjl request_callback: componentTemplate.source=" + data.componentTemplate.source)
              console.log("yjl request_callback: data=" + JSON.stringify(data.data))
              console.log("yjl request_callback: extraData=" + JSON.stringify(data.extraData))
            }
          )
          console.log("yjl Button('Request')")
        })

      PluginComponent({
        // 提供方
        template: { source: 'pages/Index4.ets&entry', bundleName: 'com.example.provider' },
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