import { common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World111';
  context = getContext(this) as common.UIAbilityContext;

  build() {
    Column() {
      Button('connectUIServiceExtensionAbility 201')
        .onClick(() => {
          let startWant: Want = {
            bundleName: 'com.acts.myapplicationb',
            abilityName: 'UIServiceExtAbility',
          };

          let dataCallBack: common.UIServiceExtensionConnectCallback = {
            // 接收数据
            onData: (data: Record<string, Object>) => {
              console.log(`dataCallBack received data`, JSON.stringify(data));
            },
            // 连接断开
            onDisconnect: () => {
              console.log(`dataCallBack onDisconnect`);
            }
          }

          this.context.connectUIServiceExtensionAbility(startWant,
            dataCallBack)
            .then((proxy: common.UIServiceProxy) => {
              console.log(`try to connectUIServiceExtensionAbility`, JSON.stringify(proxy));
            }).catch((err: Error) => {
            let code = (err as BusinessError).code;
            let message = (err as BusinessError).message;
            console.log(`connectUIServiceExtensionAbility failed, code is ${code}, message is ${message}`);
          });
        })
    }
    .justifyContent(FlexAlign.Center)
    .height('100%')
    .width('100%')
  }
}